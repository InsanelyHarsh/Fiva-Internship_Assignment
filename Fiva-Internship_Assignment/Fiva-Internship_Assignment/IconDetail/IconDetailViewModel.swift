//
//  IconDetailViewModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

//https://api.iconfinder.com/v4/icons/{icon_id}

class IconDetailViewModel:ObservableObject{
    
    private let networkingService:NetworkingService = NetworkingService()
    private let imageLoader:ImageLoader = ImageLoader(networkingHelper: NetworkingHelper())
    weak var alertHandler:ResponseManager!
    
    @Published var image:Image = Image(systemName: "photo.fill")
    @Published var sizes:[(String,String)] = []
    
    func getIconDetail(with iconID:String)async{
        let url = "https://api.iconfinder.com/v4/icons/\(iconID)"
        do{
            let response = try await networkingService.getJSON(url: url, type: IconDetailResponseModel.self, headers: ["Authorization":"Bearer \(Constants.authKey.rawValue)"])
            
            guard response.code == nil else { return }
            
            guard let raster = response.rasterSizes else { return }
            await MainActor.run{
                self.sizes = raster.compactMap{ ( "\($0.sizeHeight!)" , "\($0.sizeWidth!)" )}
            }
            let url = raster.filter{ $0.size! == 256}.first!.formats!.first!.previewURL!
            await fetchImages(from: url)
        }
        catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
    }
    
    private func fetchImages(from url:String)async{
        do{
            let image = try await self.imageLoader.fetchImage(url: url)
            guard let image = image else{
                return
            }
            await MainActor.run{
                self.image = Image(uiImage: image)
            }
        }
        catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
    }
}
