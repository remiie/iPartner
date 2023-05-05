//
//  Card.swift
//  iPartner
//
//  Created by Роман Васильев on 05.05.2023.
//

import Foundation

typealias Cards = [Card]

struct Card: Codable {
    let id: Int?
    let image: String?
    let categories: Categories?
    let name, description: String?
}

struct Categories: Codable {
    let id: Int
    let icon, image, name: String
}

