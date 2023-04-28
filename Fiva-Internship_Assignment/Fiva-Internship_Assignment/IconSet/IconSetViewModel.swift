//
//  IconSetViewModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import Foundation
import SwiftUI

struct IconSetListItem{
    var iconSetID:String
    var iconSetName:String
    var isPremium:Bool
    var publishedAt:String
    var type:String
}
class IconSetViewModel:ObservableObject{
    @Published private(set) var iconSetList:[IconSetListItem] = []
    weak var alertHandler:ResponseManager!
    
    private let networkingService:NetworkingService = NetworkingService()
    private let imageLoader:ImageLoader = ImageLoader(networkingHelper: NetworkingHelper())
    
    func getIconSet(cateogory:String)async{
        let url = URLHandler.iconSet(category: cateogory).url
//        let url = "https://api.iconfinder.com/v4/categories/\(cateogory)/iconsets?count=10"
        await alertHandler.beginLoading()
        
        do{
            let response = try await networkingService.getJSON(url: url, type: IconSetResponseModel.self, headers: ["Authorization":"Bearer \(Constants.authKey.rawValue)"])
            
            guard response.code == nil else {
                await alertHandler.presentAlert(.badResponse())
                return
            }
            
            guard let iconset = response.iconsets else {
                await alertHandler.presentAlert(.unknownError())
                return
            }
            
            await MainActor.run{
                self.iconSetList = iconset.map{IconSetListItem(iconSetID: "\($0.iconsetID ?? 0)", iconSetName: $0.name ?? "", isPremium: $0.isPremium ?? false, publishedAt: $0.publishedAt ?? "-", type: $0.type ?? "nil")}
            }
            await alertHandler.stopLoading()
        }
        catch(let error){
            let networkingError = error as! AlertsProtocol
            await alertHandler.presentAlert(title: networkingError.alertTitle, alertDescription: networkingError.alertDescription)
        }
    }
}
