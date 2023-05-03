//
//  MainPresenterProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func getMainTitle() -> String
    func getIconImageName() -> String
    func getShowAllCardsButtonTitle() -> String
    
    func showAllCardsButtonPressed()
}
