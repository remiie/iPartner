//
//  AllCardsViewDelegate.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

typealias CardData = (title: String, description: String, image: UIImage?)

protocol AllCardsViewDelegate {

    func getItemsCount() -> Int
    func getCardData(at index: Int) -> CardData
    func selectCard(at index: Int)
}