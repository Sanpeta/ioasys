//
//  LoginView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct LoginView: View {
    //MARK: - Properties
    @State private var keyboardHeight: CGFloat = 0
    @StateObject private var keyboardHandle = KeyboardHandler()
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    //MARK: - Body
    var body: some View {
        
        Group {
            //Verificando se o usuario realizou o login
            if authViewModel.statusLogin {
                HomeView()
            } else {
                NavigationView {
                    
                    //Tela de Carregamento
                    if authViewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(3)
                        
                    } else {
                        VStack(spacing: 0) {
                            ZStack(alignment: .bottomLeading) {
                                Image("BackgroundLogin")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: UIScreen.main.bounds.height * 0.40)
                                
                                VStack(alignment: .leading) {
                                    Text("Boas vindas,")
                                        .font(Font.custom("Gilroy-ExtraBold", size: 42))
                                        .foregroundColor(.white)
                                        
                                    
                                    Text("Você está no Empresas.")
                                        .font(Font.custom("Gilroy-Light", size: 24))
                                        .foregroundColor(.white)
                                        
                                }//: VStack
                                .padding(.leading, 24)
                                .padding(.bottom, 24)
                            }//: ZStack
                            
                            VStack(alignment: .leading, spacing: 24) {
                                Text("Digite seus dados para continuar.")
                                    .foregroundColor(.black)
                                    .font(Font.custom("Gilroy-ExtraBold", size: 15))
                                    .padding(.leading, 24)
                                    .padding(.top, 24)
                                
                                CustomTextField(text: $authViewModel.email, status: $authViewModel.statusEmail, buttonType: .email)
                                
                                CustomTextField(text: $authViewModel.password, status: $authViewModel.statusPass, buttonType: .password)
                                    
                                Button {
                                    authViewModel.login(authViewModel.email, authViewModel.password)
                                } label: {
                                    Text("ENTRAR")
                                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                                        .background(authViewModel.buttonBackgroundColor)
                                        .clipShape(Capsule())
                                        .padding(.leading, 24)
                                }
                                .disabled(!authViewModel.formIsValid)

                            }//: VStack
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4, alignment: .topLeading)
                            .background(Color.white)
                        }//: VStack
                        .padding(.bottom, keyboardHandle.keyboardHeight)
                    }
                    
                    
                }//: NavigationView
            }//: ELSE
        }//: Group
    }
}

//MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
