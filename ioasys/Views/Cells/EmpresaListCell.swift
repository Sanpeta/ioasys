//
//  EmpresaListCell.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI
import Kingfisher

struct EmpresaListCell: View {
    //MARK: - Properties
    let enterprise: Enterprise
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ZStack {
                    Image("Background")
                        .resizable()
                        .frame(width: 140, height: 70, alignment: .center)
                        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                    
                    KFImage(URL(string: URL_IMAGE + enterprise.photo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 120, alignment: .center)
                        .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
                }
                .frame(height: 70)

                Text(enterprise.enterprise_name)
                    .font(Font.custom("Gilroy-Light", size: 13))
                    .foregroundColor(.gray)
                    .frame(width: 140, height: 30)
                    .background(.white)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))

            }//: VStack
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 4, x: 0, y: 3)
            
        }//: ZStack
    }
}

//MARK: - Preview
//struct EmpresaListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EmpresaListCell()
//            .previewLayout(.sizeThatFits)
//    }
//}
