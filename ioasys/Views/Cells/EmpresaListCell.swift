//
//  EmpresaListCell.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct EmpresaListCell: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ZStack {
                    Image("Background")
                        .resizable()
                        .frame(width: 130, height: 70, alignment: .center)
                        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                    
                    Image("mcPequeno")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 100, alignment: .center)
                        .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
                }
                .frame(height: 70)

                Text("McDonald's")
                    .font(.system(size: 12, weight: .semibold, design: .default))
                    .foregroundColor(.gray)
                    .frame(width: 130, height: 30)
                    .background(.white)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))

            }//: VStack
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 4, x: 0, y: 3)
            
        }//: ZStack
    }
}

struct EmpresaListCell_Previews: PreviewProvider {
    static var previews: some View {
        EmpresaListCell()
//            .previewLayout(.sizeThatFits)
    }
}
