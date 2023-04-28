//
//  Alerts.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

enum Alerts:AlertsProtocol{
    case badResponse(()->Void = { })
    case unknownError(()->Void = { })
    
    var alertTitle:String{
        switch self {
        case .badResponse:
            return "Bad Response"
        case .unknownError:
            return "Error"
        }
    }
    
    var alertDescription:String{
        switch self {
        case .badResponse:
            return "Please Try Again"
        case .unknownError:
            return "An Unknown Error Occured \n Please Try Again."
        }
    }
    
    var button:Alert.Button{
        switch self {
        case .badResponse(let action):
            return .default(Text("Okay"), action: action)
        case .unknownError(let action):
            return .default(Text("Okay"), action: action)
        }
    }
}
