//
//  IconDetailView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

struct IconDetailView: View {
    @StateObject var responseManager:ResponseManager = ResponseManager()
    @StateObject private var iconDetailVM:IconDetailViewModel = IconDetailViewModel()
    let iconID:String
    init(iconID: String) {
        self.iconID = iconID
    }
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .foregroundColor(.cyan)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .overlay {
                    iconDetailVM.image
                }
            
            List {
                ForEach(iconDetailVM.sizes,id:\.0) { values in
                    LabeledContent {
                        Image(systemName: "arrow.down.app.fill")
                    } label: {
                        Text("\(values.0)x\(values.1)")
                    }
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .onAppear{
            iconDetailVM.alertHandler = responseManager
        }
        .task {
            await iconDetailVM.getIconDetail(with: iconID)
        }
        .alert(isPresented: $responseManager.showAlert) {
            responseManager.alert
        }
    }
}

struct IconDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
//            ScrollView{
                IconDetailView(iconID: "")
                    .navigationTitle("Arrow")
                    .navigationBarTitleDisplayMode(.inline)
//            }
        }
    }
}
