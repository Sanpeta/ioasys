//
//  EmpresaView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 23/11/21.
//

import SwiftUI
import Kingfisher

struct EmpresaView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var enterprise: Enterprise
    
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
                    ZStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }

                    }
                    .offset(x: -30, y: 20)
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Text(enterprise.enterprise_name)
                            .font(Font.custom("Gilroy-ExtraBold", size: 28))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)

                        Text(enterprise.enterprise_type.enterprise_type_name)
                            .font(Font.custom("Gilroy-Light", size: 16))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }//: VStack
                    .offset(x: -10)
                    
                    Spacer()
                }//: HStack
                .frame(width: UIScreen.main.bounds.width - 100, height: 100, alignment: .center)
            }//: ZStack
            
            
            //Content
            ScrollView {
                KFImage(URL(string: URL_IMAGE + enterprise.photo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.30, alignment: .center)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    
                    
                Text(enterprise.description)
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

//MARK: - Preview
//struct EmpresaView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmpresaView(enterprise: Enterprise(id: 1, enterprise_name: "tdsaddada dsad asd asd as dasd asda s", photo: "teste", description: "teste", enterprise_type: EnterpriseType.init(id: 1, enterprise_type_name: "tesd asdasd asd asdas da da dasd ada")))
//    }
//}
