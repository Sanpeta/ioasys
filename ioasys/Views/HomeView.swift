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
    @ObservedObject var homeViewModel = HomeViewModel()
    
    private var enterprises: [Enterprise] {
        return searchText.isEmpty ? homeViewModel.enterprises : homeViewModel.filterEnterprises(name: searchText)
    }
    
    //MARK: - View
    var body: some View {
        //TODO: - Verficar um bug de busca de empresa e que ao clicar ela retorana
        NavigationView {
            VStack(alignment: isEditing ? .center : .leading) {
                
                if isEditing {
                    Text("Pesquise")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(Font.custom("Gilroy-ExtraBold", size: 28))
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                } else {
                    Text("Pesquise por uma empresa")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(Font.custom("Gilroy-ExtraBold", size: 38))
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
                            .onChange(of: searchText) { newValue in
                                if newValue.isEmpty {
                                    isEditing = false
                                } else {
                                    isEditing = true
                                }
                            }

                    }//: HStack
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(isEditing ? .purple : .gray)
                    )
                    
                    if isEditing && enterprises.isEmpty {
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
                            EmpresasGridView(enterprises: enterprises)
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
}


//MARK: - Preview
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
