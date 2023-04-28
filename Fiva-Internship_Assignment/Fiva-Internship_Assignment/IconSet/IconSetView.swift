//
//  IconSetView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import SwiftUI

//https://api.iconfinder.com/v4/categories/{category_identifier}/iconsets
struct IconSetView: View {
    @StateObject var iconsetVM:IconSetViewModel = IconSetViewModel()
    @StateObject var alertHandler:ResponseManager = ResponseManager()
    
    let categoryIdentifier:String
    
    init(categoryIdentifier: String) {
        self.categoryIdentifier = categoryIdentifier
    }
    
    var body: some View {
        VStack{
            List {
                ForEach(iconsetVM.iconSetList,id:\.iconSetID) { icon in
                    NavigationLink(value: HomeNavigationRouting.iconsetDetail(icon.iconSetID)) {
                        VStack(alignment:.leading){
                            Text(icon.iconSetName)

                            Text(icon.isPremium ? "Premium" : "Non-Premium")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                if(alertHandler.isLoading){
                    ProgressView()
                }
            }
        }
        .alert(isPresented: $alertHandler.showAlert) {
            alertHandler.alert
        }
        .onAppear{
            iconsetVM.alertHandler = alertHandler
        }
        .task{
            await iconsetVM.getIconSet(cateogory: categoryIdentifier)
        }
    }
}

struct IconSetView_Previews: PreviewProvider {
    static var previews: some View {
        IconSetView(categoryIdentifier: "arrow")
    }
}
