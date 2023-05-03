//
//  AllCardsControllerProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol AllCardsControllerProtocol: AnyObject {
    var allCardsView: AllCardsViewProtocol { get }
    var presenter: AllCardsPresenterProtocol? { get set }
    
}
