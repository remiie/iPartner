//
//  AllCardsViewProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol AllCardsViewProtocol: UIView {
    var delegate: AllCardsViewDelegate? { get set }
    var activityIndicator: UIActivityIndicatorView { get }
    func updateView(at indexPaths: [IndexPath])
    func updateView()
}
