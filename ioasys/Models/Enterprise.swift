//
//  Enterprise.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 24/11/21.
//

import Foundation

struct Enterprises: Codable {
    let enterprises: [Enterprise]
}

struct Enterprise: Hashable, Codable {
    let id: Int
    let enterprise_name: String
    let photo: String
    let description: String
    let enterprise_type: EnterpriseType
}

struct EnterpriseType: Hashable, Codable {
    let id: Int
    let enterprise_type_name: String
}
