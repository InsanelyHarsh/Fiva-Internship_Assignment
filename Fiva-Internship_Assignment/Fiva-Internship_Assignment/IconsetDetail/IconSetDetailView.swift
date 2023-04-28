//
//  IconSetDetailView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

struct IconSetDetailView: View {
    @StateObject private var iconsetDetailVM:IconSetDetailViewModel = IconSetDetailViewModel()
    @StateObject var alertHandler:ResponseManager = ResponseManager()
    let iconsetID:String
    
    private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    init(iconsetID: String) {
        self.iconsetID = iconsetID
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                LazyVGrid(columns: columns, alignment: .center, spacing: 10){
                    ForEach(iconsetDetailVM.iconList,id:\.iconID){ icon in
                        NavigationLink(value: HomeNavigationRouting.iconDetail("\(icon.iconID)")) {
                            IconDetailCell(isPremium: icon.is_premium, image: icon.rasterImage) {
                                
                            }
                        }
                    }
                }
            }
        }
        .task {
            await iconsetDetailVM.getIconDetail(iconsetID: iconsetID)
        }
        
        .onAppear{
            iconsetDetailVM.alertHandler = alertHandler
        }
        .alert(isPresented: $alertHandler.showAlert) {
            alertHandler.alert
        }
    }
}

struct IconSetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IconSetDetailView(iconsetID: "")
    }
}
