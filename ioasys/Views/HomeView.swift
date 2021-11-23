//
//  HomeView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct HomeView: View {
    //MARK: - Properties
    @State private var searchText = ""
    @State private var isEditing = false
        
    //MARK: - View
    var body: some View {
        
        VStack(alignment: isEditing ? .center : .leading) {
            
            if isEditing {
                Text("Pesquise")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.system(size: 28, weight: .semibold, design: .default))
                    .padding(.top, 24)
                    .padding(.bottom, 16)
            } else {
                Text("Pesquise por uma empresa")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.system(size: 42, weight: .semibold, design: .default))
                    .padding([.leading, .top], 16)
            }
            
            VStack(alignment:  .center) {
                
                HStack {
                    if !isEditing  {
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    }
                    
                    TextField("Buscar...", text: $searchText)
                        .frame(height: 50)
                        .padding(.horizontal, isEditing ? 16 : 0)
                        .padding(.leading, isEditing ? 0 : 8)
                        .onTapGesture {
                            isEditing = true
                        }
                }//: HStack
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 0.5)
                        .foregroundColor(isEditing ? .purple : .gray)
                )
                
                if isEditing {
                    VStack {
                        Image("ImageSearch")
                            .resizable()
                            .frame(width: 250, height: 175, alignment: .center)
                            .padding(.top, 62)
                        
                        Text("Empresa não encontrada")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                }
                
                ZStack {
                    ScrollView {
                        EmpresasGridView()
                    }
                }
                .padding(.top, 8)
                
            }//: VStack
            .padding(.horizontal, 16)
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .navigationBarHidden(true)
            
        }//: VStack
    }
}


//MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
