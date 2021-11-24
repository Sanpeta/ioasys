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
    
    
    //MARK: - Body
    var body: some View {
        LazyVGrid(columns: items, alignment: .center, spacing: 10) {
            ForEach(0...20, id: \.self) { empresa in
                NavigationLink {
                    EmpresaView()
                } label: {
                    EmpresaListCell()
                        .padding(.top, 48)
                }
            }//: ForEach
        }//: LazyVGrid
    }
}

struct EmpresasGridView_Previews: PreviewProvider {
    static var previews: some View {
        EmpresasGridView()
    }
}
