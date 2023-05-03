//
//  AllCardsController.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

final class AllCardsController: UIViewController, AllCardsControllerProtocol {
    var presenter: AllCardsPresenterProtocol?
    var allCardsView: AllCardsViewProtocol = {
        let view = AllCardsView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    fileprivate func configure() {
        view.backgroundColor = .white
    }
}
