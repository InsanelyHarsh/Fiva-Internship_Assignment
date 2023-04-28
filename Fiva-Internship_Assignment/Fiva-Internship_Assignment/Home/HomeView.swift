//
//  HomeView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var navigationManager:NavigationManager = NavigationManager()
    
    @StateObject var alertHandler:ResponseManager = ResponseManager()
    @StateObject var homeVM:HomeViewModel = HomeViewModel()
    private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        NavigationStack(path: $navigationManager.navPath){
            ZStack{
                if(homeVM.searchQuery.isEmpty == false){
                    SearchView(searchResult: $homeVM.searchResult,isLoading: $alertHandler.isLoading)
                }
                else{
                    ScrollView(.vertical, showsIndicators: false) {
                        mainView
                        if(alertHandler.isLoading){
                            ProgressView()
                        }
                    }
                }
            }
            .searchable(text: $homeVM.searchQuery)
            .navigationTitle("Icon Finder")
            .navigationDestination(for: HomeNavigationRouting.self) { value in
                ZStack{
                    switch value{
                        
                    case .iconSet(let categoryIdentifier):
                        IconSetView(categoryIdentifier:categoryIdentifier)
                            
                    case .iconsetDetail(let iconSetID):
                        IconSetDetailView(iconsetID: iconSetID)
                        
                    case .home:
                        Text("home")
                        
                    case .iconDetail(let iconID):
                        IconDetailView(iconID: iconID)
                        
                    case .iconDownload:
                        Text("iconDownload")
                    }
                }
                .navigationTitle(value.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            await self.homeVM.getIconCategories()
        }
        .onAppear{
            homeVM.alertHandler = alertHandler
        }
        .alert(isPresented: $alertHandler.showAlert) {
            alertHandler.alert
        }
    }
    

    
    var mainView:some View{
        VStack{
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(homeVM.categoryList,id:\.self) { category in
                    NavigationLink(value: HomeNavigationRouting.iconSet(category.categoryIdentifier)) {
                        Rectangle()
                            .foregroundColor(.randomColor)
                            .cornerRadius(8)
                            .frame(height: 100)
                            .overlay{
                                Text(category.name)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension Color{
    static var randomColor:Color{
        return Color(red: .random(in: 0..<1), green: .random(in: 0..<1), blue: .random(in: 0..<1))
    }
}
