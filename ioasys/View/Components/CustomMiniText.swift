//
//  CustomMiniText.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 22/11/21.
//

import SwiftUI

struct CustomMiniText: View {
    //MARK: - Properties
    @Binding var statusError: Bool
    var text: String
    
    //MARK: - Body
    var body: some View {
        Text(text)
            .font(.system(size: 13, weight: .semibold, design: .rounded))
            .foregroundColor(statusError ? .red : .init(white: 0.5, opacity: 1))
            .padding([.horizontal], 32)
    }
}

//MARK: - Preview
struct CustomMiniText_Previews: PreviewProvider {
    static var previews: some View {
        CustomMiniText(statusError: .constant(false), text: "Teste")
    }
}
