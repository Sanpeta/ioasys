//
//  LaunchView.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct LaunchView: View {
    @State private var showLogin = false
    @State private var showLogo = 1.0
    @State private var backgroundShow = 0.0
    
    var body: some View {
        Group {
            if showLogin {
                LoginView()
            } else {
                ZStack {
                    
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                        
                    Color
                        .black
                        .opacity(backgroundShow)
                    
                    
                    Image("Logo_white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 57, alignment: .center)
                        .opacity(showLogo)
                        
                }
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.8)) {
                showLogo = 0
                backgroundShow = 0.6
            }
            
            withAnimation(Animation.linear.delay(2)) {
                showLogin.toggle()
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
