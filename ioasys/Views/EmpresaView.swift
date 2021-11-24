//
//  EmpresaView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 23/11/21.
//

import SwiftUI

struct EmpresaView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            //Nav
            ZStack(alignment: .bottom) {
                Image("BackgroundMini")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    

                HStack(alignment: .top, spacing: 0) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    .offset(x: -60, y: 10)

                    VStack(spacing: 4) {
                        Text("McDonald's")
                            .font(Font.custom("Gilroy-ExtraBold", size: 28))
                            .foregroundColor(.white)
                        
                        Text("Restaurante * Fast-food")
                            .font(Font.custom("Gilroy-Light", size: 16))
                            .foregroundColor(.white)
                    }//: VStack
                    .offset(x: -10)
                }//: HStack
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
            }//: ZStack
            
            
            //Content
            ScrollView {
                Image("mcGrande")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.30, alignment: .center)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    
                    
                Text("      McDonald's Corporation é a maior cadeia mundial de restaurantes de fast food de hambúrguer, servindo cerca de 68 milhões de clientes por dia em 119 países através de 37 mil pontos de venda. Com sede nos Estados Unidos, a empresa começou em 1940 como uma churrascaria operada por Richard e Maurice McDonald. Em 1948, eles reorganizaram seus negócios como uma hamburgueria que usava os princípios de uma linha de produção. O empresário Ray Kroc ingressou na empresa como franquiado em 1955. ")
                    .font(Font.custom("Gilroy-Light", size: 18))
                    .foregroundColor(Color("ColorNeutral2"))
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 24)
                    .padding(.horizontal, 16)
            }//: ScrollView
            .frame(width: UIScreen.main.bounds.width)
        }//: VStack
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct EmpresaView_Previews: PreviewProvider {
    static var previews: some View {
        EmpresaView()
    }
}
