//
//  AllCardsPresenterProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import Foundation

protocol AllCardsPresenterProtocol: AnyObject {
    func getNavigationTitle() -> String
    func getImageName(forCard id: Int) -> String
    func selectCard(at index: Int)
    
    func getCardsBy(offset: Int)
    func getItemsCount() -> Int
    
    func getCardName(at index: Int) -> String?
    func getCardDescription(at index: Int) -> String?
    func getCardImageName(at index: Int) -> String?
    
    func searchCards(query: String)
    
}
