//
//  IconDetailResponseModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import Foundation


// MARK: - IconDetailResponseModel
struct IconDetailResponseModel: Codable {
    let code:String?
    
    let iconID: Int?
    let isPremium: Bool?
    let rasterSizes: [RasterSize]?
    
    enum CodingKeys: String, CodingKey {
        case iconID = "icon_id"
        case isPremium = "is_premium"
        case rasterSizes = "raster_sizes"
        case code
    }
}
