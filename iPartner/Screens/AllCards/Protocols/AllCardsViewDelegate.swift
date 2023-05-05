//
//  AllCardsViewDelegate.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

typealias CardData = (title: String, description: String, image: String?)

protocol AllCardsViewDelegate {

    func getItemsCount() -> Int
    func getCardData(at index: Int) -> CardData
    func selectCard(at index: Int)
    
    func hideNavBar()
    func showNavBar()
    
    func loadCards(from offset: Int)
}
