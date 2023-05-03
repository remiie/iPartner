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
}
