//
//  CardDetailControllerProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import UIKit

protocol CardDetailControllerProtocol: AnyObject {
    var cardDetailView: CardDetailViewProtocol { get }
    var presenter: CardDetailPresenterProtocol? { get set }

}
