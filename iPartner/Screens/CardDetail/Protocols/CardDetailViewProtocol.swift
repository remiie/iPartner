//
//  CardDetailViewProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import UIKit

protocol CardDetailViewProtocol: UIView, AnyObject {
    var dataSource: CardDetailViewDataSource? { get set }
    func setCompanyIcon(image: String)
    func setCardImage(_ image: String)
    func setCardTitle(_ text: String)
    func setCardDescription(_ text: String)
}

protocol CardDetailViewDataSource: AnyObject {
    
}
