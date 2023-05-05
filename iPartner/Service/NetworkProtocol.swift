//
//  NetworkProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 05.05.2023.
//

import UIKit
import Foundation

protocol NetworkProtocol: AnyObject {
    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ())
    func loadImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ())
    func fetchItem(id: Int, completion: @escaping (Result<Card, Error>) -> ())
}
