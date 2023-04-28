//
//  CategoryListResponseModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import Foundation

// MARK: - CategoryListResponseModel
struct CategoryListResponseModel: Codable {
    
    let message,code:String?
    
    let totalCount: Int?
    let categories: [CategoryData]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case categories,message,code
    }
}

// MARK: - CategoryData
struct CategoryData: Codable {
    let name, identifier: String?
}


/*
 {
   "code": "unauthorized",
   "message": "The provided API key is invalid."
 }
 
 
 
 {
   "total_count": 122,
   "categories": [
     {
       "name": "Abstract",
       "identifier": "abstract"
     },
     {
       "name": "Agriculture, farming, & gardening",
       "identifier": "agriculture-farming-gardening"
     },
     {
       "name": "AI, robots & drones",
       "identifier": "ai-robots-drones"
     },
     {
       "name": "Animals",
       "identifier": "animal"
     },
     {
       "name": "Architecture & urban planning",
       "identifier": "architecture-urban-planning"
     },
     {
       "name": "Arrows",
       "identifier": "arrow"
     },
     {
       "name": "Art & design",
       "identifier": "art-design"
     },
     {
       "name": "Arts & multimedia",
       "identifier": "arts-multimedia"
     },
     {
       "name": "Auto service & repair",
       "identifier": "auto-service-repair"
     },
     {
       "name": "Avatars",
       "identifier": "avatar"
     }
   ]
 }
 */
