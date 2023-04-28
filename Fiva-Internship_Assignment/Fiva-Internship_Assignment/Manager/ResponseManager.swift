//
//  AlertHandler.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

//Handles alert & Progress View
class ResponseManager:ObservableObject{
    @Published private(set) var alert:Alert!
    @Published var showAlert:Bool = false
    
    @Published var isLoading:Bool = false
    
    @MainActor func beginLoading(){
        isLoading = true
    }
    @MainActor func stopLoading(){
        isLoading = false
    }
    
    @MainActor
    public func presentAlert(_ alert:Alerts){
        self.alert = Alert(title: Text(alert.alertTitle), message: Text(alert.alertDescription), dismissButton: alert.button)
        self.isLoading = false
        self.showAlert = true
    }
    
    @MainActor
    public func presentAlert(title:String,alertDescription:String = "",button:Alert.Button = .default(Text("Okay"))){
        self.alert = Alert(title: Text(title), message: Text(alertDescription), dismissButton: button)
        self.isLoading = false
        self.showAlert = true
    }
}
