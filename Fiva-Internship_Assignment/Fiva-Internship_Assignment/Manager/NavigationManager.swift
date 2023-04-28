//
//  NavigationManager.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import Foundation
import SwiftUI

protocol NavigationRouting{
    var navigationTitle:String { get }
}

enum HomeNavigationRouting:NavigationRouting,Hashable{
    case home
    case iconSet(String) //category_indentifier
    case iconsetDetail(String) //icon_set_id
    case iconDetail(String) //icon_id
    case iconDownload
    
    var navigationTitle: String{
        switch self {
        case .home:
            return "Home"
        case .iconSet:
            return "Icon Set"
        case .iconsetDetail:
            return "Icon Set Detail"
        case .iconDetail:
            return "Icon Detail"
        case .iconDownload:
            return "Download"
        }
    }
}

class NavigationManager:ObservableObject{
    @Published var navPath:NavigationPath = .init()
    
}
