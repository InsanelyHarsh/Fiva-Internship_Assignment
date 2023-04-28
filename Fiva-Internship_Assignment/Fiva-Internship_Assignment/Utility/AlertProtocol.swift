//
//  AlertProtocol.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

protocol AlertsProtocol{
    var alertTitle:String { get }
    var alertDescription:String { get }
    var button:Alert.Button { get }
}

extension AlertsProtocol{
    var button:Alert.Button{
        .default(Text("Okay"))
    }
}
