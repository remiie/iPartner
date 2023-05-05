//
//  NetworkManager.swift
//  iPartner
//
//  Created by Роман Васильев on 05.05.2023.
//

import UIKit
import Foundation

final class NetworkManager: NetworkProtocol {
    
    static let shared = NetworkManager()
    
    private let сardsComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "shans.d2.i-partner.ru"
        components.path = "/api/ppp/index/"
        return components
    }()
    
    private let baseComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "shans.d2.i-partner.ru"
        return components
    }()
    
    private let itemComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "shans.d2.i-partner.ru"
        components.path = "/api/ppp/item/"
        return components
    }()
    
    
    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ()) {
        var components = сardsComponents
        components.queryItems = [
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        
        guard let url = components.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cards = try decoder.decode(Cards.self, from: data)
                completion(.success(cards))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

extension NetworkManager {
    func loadImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        
        var imageComponents = baseComponents
        imageComponents.path = urlString
        
        guard let url = imageComponents.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            completion(.success(image))
        }
        
        task.resume()
    }
}

extension NetworkManager {
    
    func fetchItem(id: Int, completion: @escaping (Result<Card, Error>) -> ()) {
        var components = itemComponents
        components.queryItems = [URLQueryItem(name: "id", value: "\(id)")]
        
        guard let url = components.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let card = try decoder.decode(Card.self, from: data)
                completion(.success(card))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


enum NetworkError: Error {
    case invalidURL
    case invalidData
}

