//
//  CustomTextField.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

enum CustomTextFieldType {
    case password
    case email
}

struct CustomTextField: View {
    //MARK: - Properties
    @Binding var text: String
    @Binding var status: Bool
    @State private var isSecured: Bool = true
    var buttonType: CustomTextFieldType
    
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 2) {
                
                switch buttonType {
                case .email:
                    if !text.isEmpty {
                        CustomMiniText(statusError: $status, text: "Email")
                    }
                    
                    TextField("Email", text: $text)
                        .frame(height: 50)
                        .padding(.horizontal, 16)
                        .cornerRadius(2)
                        .foregroundColor(status ? .red : .black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray)
                        )
                        .padding(.horizontal, 24)
                    
                    if !text.isEmpty && status == true {
                        CustomMiniText(statusError: $status, text: "Endereço de email inválido")
                    }
                    
                case .password:
                    if !text.isEmpty {
                        CustomMiniText(statusError: $status, text: "Senha")
                    }
                    
                    ZStack(alignment: .trailing) {
                        
                        if isSecured {
                            SecureField("Senha", text: $text)
                                .frame(height: 50)
                                .padding(.horizontal, 16)
                                .cornerRadius(2)
                                .foregroundColor(status ? .red : .black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.gray)
                                )
                                .padding(.horizontal, 24)
                        } else {
                            TextField("Senha", text: $text)
                                .frame(height: 50)
                                .padding(.horizontal, 16)
                                .cornerRadius(2)
                                .foregroundColor(status ? .red : .black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.gray)
                                )
                                .padding(.horizontal, 24)
                        }
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                                .offset(x: -32)
                                .padding(.leading, 32)
                        }
                    }
                    
                    
                    
                    if !text.isEmpty && status == true {
                        CustomMiniText(statusError: $status, text: "Senha inválida")
                    }
                    
                }
                
            }//: VStack
        }//: ZStack
    }
}


//MARK: - Preview
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), status: .constant(false), buttonType: .password)
            .previewLayout(.sizeThatFits)
    }
}
