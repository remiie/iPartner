//
//  NetworkProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 05.05.2023.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ())
}
