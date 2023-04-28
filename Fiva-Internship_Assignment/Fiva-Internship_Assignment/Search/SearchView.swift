//
//  SearchView.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

struct SearchResponse{
    let image:Image
    let identifier:String
}

struct SearchView: View {
    @Binding var searchResult:[SearchResponse]
    @Binding var isLoading:Bool
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                if(isLoading){
                    ProgressView()
                }
                LazyVGrid(columns: columns, alignment: .center, spacing: 10){
                    ForEach(searchResult,id:\.identifier) { result in
                        result.image
                    }
                }
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchResult: .constant([]),isLoading: .constant(true))
    }
}
