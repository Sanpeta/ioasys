//
//  LoginView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct LoginView: View {
    //MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @State private var statusEmail = false
    @State private var statusPass = false
    @State private var statusButton = false
    @State private var keyboardHeight: CGFloat = 0
    @StateObject private var keyboardHandle = KeyboardHandler()
    
    //MARK: - Body
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Image("BackgroundLogin")
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height*0.5)
                    
                    VStack(alignment: .leading) {
                        Text("Boas vindas,")
                            .font(Font.custom("Gilroy-ExtraBold", size: 42))
                            .foregroundColor(.white)
                            
                        
                        Text("Você está no Empresas.")
                            .font(Font.custom("Gilroy-Light", size: 24))
                            .foregroundColor(.white)
                            
                    }//: VStack
                    .padding(.leading, 24)
                    .offset(y: 24)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Digite seus dados para continuar.")
                        .foregroundColor(.black)
                        .font(Font.custom("Gilroy-ExtraBold", size: 15))
                        .padding(.leading, 24)
                        .padding(.top, 24)
                    
                    CustomTextField(text: $email, status: $statusEmail, buttonType: .email)
                    
                    CustomTextField(text: $password, status: $statusPass, buttonType: .password)
                        
                    NavigationLink(destination: HomeView()) {
                        Text("ENTRAR")
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                            .background(statusButton ? .gray : .black)
                            .clipShape(Capsule())
                            .disabled(statusButton)
                            .padding(.leading, 24)
                    }
                }//: VStack
                .background(Color.white)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.45, alignment: .center)
            }//: VStack
            .padding(.bottom, 48)
            .padding(.bottom, keyboardHandle.keyboardHeight)
        }//: NavigationView
    }
}

//MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
