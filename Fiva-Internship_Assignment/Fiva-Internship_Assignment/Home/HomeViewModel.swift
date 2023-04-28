//
//  HomeViewModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import SwiftUI
import Combine

struct CategoryItem:Hashable{
    let name:String
    let categoryIdentifier:String
}
class HomeViewModel:ObservableObject{
    weak var alertHandler:ResponseManager!
    private let networkingService:NetworkingService
    
    @Published var searchQuery:String = ""
    @Published var searchResult:[SearchResponse] = []
    private let imageLoader:ImageLoader = ImageLoader(networkingHelper: NetworkingHelper())
    @Published private(set) var categoryList:[CategoryItem] = []
    
    private var categoryCount = 10
    
    
    private var searchCount = 5
    private var cancellables = Set<AnyCancellable>()

    
    init(networkingService:NetworkingService = NetworkingService()){
        self.networkingService = networkingService
        setup()
    }
    
    func getIconCategories()async{
        do{
            await alertHandler.beginLoading()
            
            let url = "https://api.iconfinder.com/v4/categories?count=\(categoryCount)"
            
            let response = try await networkingService.getJSON(url: url, type: CategoryListResponseModel.self, headers: ["Authorization":"Bearer \(Constants.authKey.rawValue)"])
            
            guard response.code == nil else{
                await alertHandler.presentAlert(.badResponse())
                return
            }
            
            guard let cateogories = response.categories else {
                await alertHandler.presentAlert(.unknownError())
                return
            }
            
            DispatchQueue.main.async {
                self.categoryList = cateogories.filter{$0.name != nil && $0.identifier != nil}.map{ CategoryItem(name: $0.name!, categoryIdentifier: $0.identifier!)}
            }
            await alertHandler.stopLoading()
        }
        catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
    }
    

    func search()async{
        do{
            await alertHandler.beginLoading()
            
            let url = URLHandler.getCateogry(searchQuery: searchQuery, searchCount: "\(searchCount)").url
            let response = try await networkingService.getJSON(url: url, type: SearchResponseModel.self, headers: ["Authorization":"Bearer \(Constants.authKey.rawValue)"])
            
            if(response.code != nil){
                await  alertHandler.presentAlert(.badResponse())
                return
            }
            
            guard let iconList = response.icons else {
                await alertHandler.presentAlert(.unknownError())
                return
            }
            let iconIdentifier = iconList.compactMap{$0.iconID!}
            let imageURLs = iconList.compactMap{ $0.rasterSizes!.filter{ $0.size == 128}}.flatMap{ $0 }.compactMap{ $0.formats!.first!.previewURL!}
            
            let images = await fetchImages(from: imageURLs)
            
            await MainActor.run{
                for idx in (0..<imageURLs.count){
                    searchResult.append(SearchResponse(image: Image(uiImage: images[idx]), identifier: "\(iconIdentifier[idx])"))
                }
            }
            await alertHandler.stopLoading()
            
        }catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
    }
    
    
    func fetchImages(from urls:[String])async->[UIImage]{
        do{
            var images:[UIImage] = []
            try await withThrowingTaskGroup(of: UIImage.self) { group in
                
                for url in urls{
                    if let image = CacheHandler.Instance.getObject(forKey: NSString(string: url)){
                        images.append(UIImage(data: image)!)
                        continue
                    }else{
                        group.addTask {
                            let image = try? await self.imageLoader.fetchImage(url: url)
                            guard image != nil else {
                                return UIImage(systemName: "house")!
                            }
                            CacheHandler.Instance.set(object: NSData(data: image!.pngData()!), forKey: NSString(string: url))
                            return image!
                        }
                    }
                }
                
                for try await image in group{
                    images.append(image)
                }
            }
            return images
        }
        catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
        return []
    }
    
    private func setup(){
        $searchQuery
            .debounce(for: 0.45, scheduler: DispatchQueue.main)
            .sink { value in
                if(value.isEmpty == false){
                    Task{
                        await self.search()
                    }
                }else{
                    self.searchResult = []
                }
            }
            .store(in: &cancellables)
    }
}
