//
//  IconsetDetailResponseModel.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import Foundation

/*
 {
   "code": "unauthorized",
   "message": "The provided API key is invalid."
 }
 */
// MARK: - IconsetDetailResponseModel
struct IconsetDetailResponseModel: Codable {
    let code:String?
    let message:String?
    
    let totalCount: Int?
    let icons: [IconDetail]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case icons,code,message
    }
}

// MARK: - Icon
struct IconDetail: Codable {
    let categories: [IconCategory]?
    let containers: [ContainerInfo]?
    let tags: [String]?
    let publishedAt, type: String?
    let iconID: Int?
//    let vectorSizes: [VectorSize]?
    let styles: [Category]?
    let isPremium: Bool?
    let rasterSizes: [RasterSizeDetail]
    let isIconGlyph: Bool?

    enum CodingKeys: String, CodingKey {
        case categories, containers, tags
        case publishedAt = "published_at"
        case type
        case iconID = "icon_id"
//        case vectorSizes = "vector_sizes"
        case styles
        case isPremium = "is_premium"
        case rasterSizes = "raster_sizes"
        case isIconGlyph = "is_icon_glyph"
    }
}

// MARK: - Category
struct IconCategory: Codable {
    let name: String?
    let identifier: String?
}



// MARK: - Container
struct ContainerInfo: Codable {
    let format: String?
    let downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case format
        case downloadURL = "download_url"
    }
}

// MARK: - RasterSize
struct RasterSizeDetail: Codable {
    let sizeHeight: Int
    let formats: [FormatElementInfo]
    let size, sizeWidth: Int

    enum CodingKeys: String, CodingKey {
        case sizeHeight = "size_height"
        case formats, size
        case sizeWidth = "size_width"
    }
}

// MARK: - FormatElement
struct FormatElementInfo: Codable {
    let previewURL: String
    let format: String
    let downloadURL: String

    enum CodingKeys: String, CodingKey {
        case previewURL = "preview_url"
        case format
        case downloadURL = "download_url"
    }
}

//enum FormatEnum: String, Codable {
//    case png = "png"
//}


// MARK: - VectorSize
//struct VectorSize: Codable {
//    let sizeHeight: Int?
//    let formats: [Container]?
//    let size, sizeWidth: Int?
//    let targetSizes: [[Int]]?
//
//    enum CodingKeys: String, CodingKey {
//        case sizeHeight = "size_height"
//        case formats, size
//        case sizeWidth = "size_width"
//        case targetSizes = "target_sizes"
//    }
//}


/*
 {
   "total_count": 6,
   "icons": [
     {
       "icon_id": 182502,
       "tags": [
         "iconfinder",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 16,
           "size_height": 2
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 20,
           "size_height": 3
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 24,
           "size_height": 3
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 32,
           "size_height": 5
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 48,
           "size_height": 7
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 64,
           "size_height": 10
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 128,
           "size_height": 21
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 256,
           "size_height": 42
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/409/text_invert-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 85
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/svg/516500/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/182502/formats/ai/516500/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 409,
           "size_width": 409,
           "size_height": 68
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     },
     {
       "icon_id": 182503,
       "tags": [
         "iconfinder",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 15,
           "size_height": 16
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 19,
           "size_height": 20
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 23,
           "size_height": 24
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 31,
           "size_height": 32
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 46,
           "size_height": 48
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 62,
           "size_height": 64
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 124,
           "size_height": 128
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 248,
           "size_height": 256
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/68/eye_invert-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 496,
           "size_height": 512
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/svg/516501/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/182503/formats/ai/516501/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 68,
           "size_width": 66,
           "size_height": 68
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     },
     {
       "icon_id": 182504,
       "tags": [
         "iconfinder",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 16,
           "size_height": 2
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 20,
           "size_height": 3
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 24,
           "size_height": 3
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 32,
           "size_height": 5
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 48,
           "size_height": 7
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 64,
           "size_height": 10
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 128,
           "size_height": 21
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 256,
           "size_height": 42
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/410/text_black-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 84
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/svg/516502/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/182504/formats/ai/516502/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 410,
           "size_width": 410,
           "size_height": 68
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     },
     {
       "icon_id": 182505,
       "tags": [
         "iconfinder",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 16,
           "size_height": 15
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 20,
           "size_height": 19
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 24,
           "size_height": 23
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 32,
           "size_height": 31
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 48,
           "size_height": 47
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 64,
           "size_height": 63
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 128,
           "size_height": 126
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 256,
           "size_height": 252
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/69/eye_black-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 504
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/svg/516503/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/182505/formats/ai/516503/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 69,
           "size_width": 69,
           "size_height": 68
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     },
     {
       "icon_id": 182506,
       "tags": [
         "iconfinder",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [
         {
           "format": "ico",
           "download_url": "https://api.iconfinder.com/v4/icons/182506/containers/ico/download"
         },
         {
           "format": "icns",
           "download_url": "https://api.iconfinder.com/v4/icons/182506/containers/icns/download"
         }
       ],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 16,
           "size_height": 16
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 20,
           "size_height": 20
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 24,
           "size_height": 24
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 32,
           "size_height": 32
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 48,
           "size_height": 48
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 64,
           "size_height": 64
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 128,
           "size_height": 128
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 256,
           "size_height": 256
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/eye_black_circle-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 512
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/svg/516504/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/182506/formats/ai/516504/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 512
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     },
     {
       "icon_id": 340635,
       "tags": [
         "iconfinder pro",
         "logo"
       ],
       "published_at": "2017-05-30T10:49:05.325336Z",
       "is_premium": false,
       "type": "vector",
       "containers": [
         {
           "format": "ico",
           "download_url": "https://api.iconfinder.com/v4/icons/340635/containers/ico/download"
         },
         {
           "format": "icns",
           "download_url": "https://api.iconfinder.com/v4/icons/340635/containers/icns/download"
         }
       ],
       "raster_sizes": [
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-16.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/16/download"
             }
           ],
           "size": 16,
           "size_width": 16,
           "size_height": 16
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-20.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/20/download"
             }
           ],
           "size": 20,
           "size_width": 20,
           "size_height": 20
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-24.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/24/download"
             }
           ],
           "size": 24,
           "size_width": 24,
           "size_height": 24
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-32.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/32/download"
             }
           ],
           "size": 32,
           "size_width": 32,
           "size_height": 32
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-48.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/48/download"
             }
           ],
           "size": 48,
           "size_width": 48,
           "size_height": 48
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-64.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/64/download"
             }
           ],
           "size": 64,
           "size_width": 64,
           "size_height": 64
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-128.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/128/download"
             }
           ],
           "size": 128,
           "size_width": 128,
           "size_height": 128
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-256.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/256/download"
             }
           ],
           "size": 256,
           "size_width": 256,
           "size_height": 256
         },
         {
           "formats": [
             {
               "format": "png",
               "preview_url": "https://cdn2.iconfinder.com/data/icons/iconfinder-logo/512/logo-pro-only-black-512.png",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/png/512/download"
             }
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 512
         }
       ],
       "vector_sizes": [
         {
           "formats": [
             {
               "format": "svg",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/svg/729528/download"
             },
             {
               "format": "ai",
               "download_url": "https://api.iconfinder.com/v4/icons/340635/formats/ai/729528/download"
             }
           ],
           "target_sizes": [
             [
               16,
               20,
               24,
               32,
               48,
               64,
               128,
               256,
               512
             ]
           ],
           "size": 512,
           "size_width": 512,
           "size_height": 512
         }
       ],
       "styles": [
         {
           "identifier": "solid",
           "name": "Solid"
         }
       ],
       "categories": [
         {
           "identifier": "mixed",
           "name": "Mixed"
         }
       ],
       "is_icon_glyph": false
     }
   ]
 }
 */
