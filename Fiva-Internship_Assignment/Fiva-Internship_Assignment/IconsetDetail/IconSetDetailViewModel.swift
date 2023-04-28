//
//  IconSetDetailView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import Foundation
import UIKit
//https://api.iconfinder.com/v4/iconsets/{iconset_id}/icons

struct IconItem{
    let iconID:Int
    let tags:[String]
    let is_premium:Bool
    let type:String
//    let containers:[ContainerInfo]
    var rasterImage:UIImage? = nil
//    let vectorSizes:[VectorSize]
}

class IconSetDetailViewModel:ObservableObject{
    @Published var iconList:[IconItem] = []
    
    weak var alertHandler:ResponseManager!
    private let networkingService:NetworkingService = NetworkingService()
    private let imageLoader:ImageLoader = ImageLoader(networkingHelper: NetworkingHelper())
    private let count:Int = 10
    
    func getIconDetail(iconsetID:String)async{
//        let url = "https://api.iconfinder.com/v4/iconsets/\(iconsetID)/icons?count=\(count)"
        let url = URLHandler.iconSetDetail(iconSetID: iconsetID, searchCount: "\(count)").url
        
        do{
            await alertHandler.beginLoading()
            let response = try await networkingService.getJSON(url: url, type: IconsetDetailResponseModel.self, headers: ["Authorization":"Bearer \(Constants.authKey.rawValue)"])
            
            guard response.code == nil else {
                await alertHandler.presentAlert(.badResponse())
                return
            }
            
            await MainActor.run{
                iconList = response.icons!.compactMap{ IconItem(iconID: $0.iconID ?? 0, tags: $0.tags ?? [], is_premium: $0.isPremium ?? false,
                                                                type: $0.type ?? "none")}
            }
            await alertHandler.stopLoading()
            
            let urls = response.icons!.map{$0.rasterSizes.last!.formats[0].previewURL}
            let images = await fetchImages(from: urls)
            
            await MainActor.run{
                for i in images.indices{
                    iconList[i].rasterImage = images[i]
                }
            }
        }
        catch(let error){
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
}
