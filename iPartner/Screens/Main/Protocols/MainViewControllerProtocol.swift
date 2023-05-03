//
//  MainViewControllerProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    var titlelabel: UILabel { get }
    var iconImage: UIImageView { get }
    var showAllCardsButton: UIButton { get }
}
