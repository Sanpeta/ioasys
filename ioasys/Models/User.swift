//
//  User.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 24/11/21.
//

import Foundation

struct User: Hashable, Codable {
    let investor: Investor
    let enterprise: Bool
    let success: Bool
}

struct Investor: Hashable, Codable {
    let id: Int
    let email: String
    let investor_name: String
}
