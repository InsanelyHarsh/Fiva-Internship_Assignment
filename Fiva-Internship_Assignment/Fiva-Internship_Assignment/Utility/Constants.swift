//
//  Constants.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import Foundation


enum Constants:String{
    case apiKey = "7kDO4kksXUfLQ4D3ZVIMiEaUctGQPChQmutezbX9crC7oiFjA3njFsdgZsWAQa8L"
    case clientID = "ZBMCCtkUoh5y7pRu8RkgK7XA2rfeMqKhKQKGMLLEddQZu1FyjhbBL3LaYDTfDuL4"
    
    case authKey = "X0vjEUN6KRlxbp2DoUkyHeM0VOmxY91rA6BbU5j3Xu6wDodwS0McmilLPBWDUcJ1"
}


enum URLHandler{
    
    case getCateogry(searchQuery:String,searchCount:String)
    case iconSet(category:String)
    case iconSetDetail(iconSetID:String,searchCount:String)
    var url:String{
        switch self {
        case .getCateogry(let searchQuery, let searchCount):
            return "https://api.iconfinder.com/v4/icons/search?query=\(searchQuery)&count=\(searchCount)"
        case .iconSet(category: let category):
            return "https://api.iconfinder.com/v4/categories/\(category)/iconsets"

        case .iconSetDetail(iconSetID: let iconSetID, searchCount: let searchCount):
            return "https://api.iconfinder.com/v4/iconsets/\(iconSetID)/icons?count=\(searchCount)"
        }
    }
}
