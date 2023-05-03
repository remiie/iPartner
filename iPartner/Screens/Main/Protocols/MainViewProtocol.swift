//
//  MainViewControllerProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol MainViewProtocol: UIView {
    var titlelabel: UILabel { get }
    var iconImage: UIImageView { get }
    var showAllCardsButton: UIButton { get }
    var delegate: MainViewDelegate? { get set }
    
    func setTitle(_ title: String?)
    func setIconImage(_ image: UIImage?)
    func setTitleForButton(_ title: String?)
}
