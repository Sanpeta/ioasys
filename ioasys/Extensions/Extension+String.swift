//
//  Extension+String.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 25/11/21.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "Self Matches %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
