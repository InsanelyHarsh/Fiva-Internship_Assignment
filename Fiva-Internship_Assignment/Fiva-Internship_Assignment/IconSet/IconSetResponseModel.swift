//
//  IconSetResponseModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import Foundation

// MARK: - IconSetResponseModel
struct IconSetResponseModel: Codable {
    let code,message:String?
    let totalCount: Int?
    let iconsets: [Iconset]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case iconsets,code,message
    }
}

// MARK: - Iconset
struct Iconset: Codable {
    let iconsetID: Int?
    let identifier, name: String?
    let iconsCount: Int?
    let isPremium: Bool?
    let publishedAt: String?
    let type: String?
    let prices: [Price]?
    let styles, categories: [IconSetCategory]?
    let areAllIconsGlyph: Bool?
    let author: Author?

    enum CodingKeys: String, CodingKey {
        case iconsetID = "iconset_id"
        case identifier, name
        case iconsCount = "icons_count"
        case isPremium = "is_premium"
        case publishedAt = "published_at"
        case type, prices, styles, categories
        case areAllIconsGlyph = "are_all_icons_glyph"
        case author
    }
}

// MARK: - Author
struct Author: Codable {
    let userID: Int?
    let username, name, company: String?
    let isDesigner: Bool?
    let iconsetsCount: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username, name, company
        case isDesigner = "is_designer"
        case iconsetsCount = "iconsets_count"
    }
}

// MARK: - Category
struct IconSetCategory: Codable {
    let identifier, name: String?
}


enum Currency: String, Codable {
    case usd = "USD"
}

enum Name: String, Codable {
    case basicLicense = "Basic license"
}

enum Scope: String, Codable {
    case basic = "basic"
}
