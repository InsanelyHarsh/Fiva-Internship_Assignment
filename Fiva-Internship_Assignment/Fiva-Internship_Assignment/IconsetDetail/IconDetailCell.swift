//
//  IconDetailCell.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import SwiftUI

struct IconDetailCell: View {
    
    let isPremium:Bool
    var image:UIImage?
    let downloadButtonAction:()->Void
    
    init(isPremium: Bool, image: UIImage?, downloadButtonAction: @escaping () -> Void) {
        self.isPremium = isPremium
        self.image = image
        self.downloadButtonAction = downloadButtonAction
    }
    
    var body: some View {
        VStack{
            if let image = image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 155, height: 155)
            }else{
                Image(systemName: "photo.fill")
            }
            
            HStack(spacing: 40){
                Text(isPremium ? "Premium" : "Non Premium")
                    .foregroundColor(isPremium ? .orange : .gray)
                    .bold()
                
                Button {
                    downloadButtonAction()
                } label: {
                    Image(systemName: "arrow.down.app.fill")
                        .bold()
                        .tint(.cyan)
                }.disabled(isPremium)

            }
        }
        .padding(10)
        .background{
            Rectangle().cornerRadius(10).shadow(radius: 6).foregroundColor(.white)
        }
    }
}

struct IconDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        IconDetailCell(isPremium: false, image: UIImage(systemName: "photo.fill")){
            
        }
    }
}
