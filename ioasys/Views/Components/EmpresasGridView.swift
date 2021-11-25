//
//  EmpresasGridView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 23/11/21.
//

import SwiftUI

struct EmpresasGridView: View {
    //MARK: - Properties
    private let items = [GridItem(), GridItem()]
    private let widthScreen = UIScreen.main.bounds.width / 2
    let enterprises: [Enterprise]
    
    
    //MARK: - Body
    var body: some View {
        LazyVGrid(columns: items, alignment: .center, spacing: 10) {
            ForEach(enterprises, id: \.self) { enterprise in
                
                //TODO: - VERIFICAR NO DISPOSITIVO REAL
                NavigationLink {
                    EmpresaView(enterprise: enterprise)
                } label: {
                    EmpresaListCell(enterprise: enterprise)
                        .padding(.top, 48)
                }//: NavigationLink
            }//: ForEach
        }//: LazyVGrid
    }
}

//MARK: - Preview
//struct EmpresasGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmpresasGridView()
//    }
//}
