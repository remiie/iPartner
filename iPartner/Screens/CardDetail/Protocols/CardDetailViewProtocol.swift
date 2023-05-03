//
//  CardDetailViewProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import UIKit

protocol CardDetailViewProtocol: UIView, AnyObject {
    var dataSource: CardDetailViewDataSource? { get set }
}

protocol CardDetailViewDataSource: AnyObject {
    
}
