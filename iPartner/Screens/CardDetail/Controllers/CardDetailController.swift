//
//  CardDetailController.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import UIKit

final class CardDetailController: UIViewController, CardDetailControllerProtocol {
    
    var presenter: CardDetailPresenterProtocol?
    
    var cardDetailView: CardDetailViewProtocol = {
        let view = CardDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    fileprivate func configure() {
        view.addSubview(cardDetailView)
        view.backgroundColor = .systemGreen
        navigationController?.navigationBar.tintColor = .white
        NSLayoutConstraint.activate([
            cardDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        cardDetailView.setCardTitle("Title")
        cardDetailView.setCardDescription("Description")
        cardDetailView.setCardImage(UIImage(named: "empty_card") ?? UIImage())
        cardDetailView.setCompanyIcon(image: UIImage(named: "empty_conpany") ?? UIImage())
    }
    
}
