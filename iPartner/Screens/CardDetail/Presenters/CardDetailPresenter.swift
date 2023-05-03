//
//  CardDetailPresenter.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import Foundation

final class CardDetailPresenter: CardDetailPresenterProtocol {
    private weak var view: CardDetailViewProtocol?
    private var router: RouterProtocol?
    
    init(router: RouterProtocol, view: CardDetailViewProtocol) {
        self.view = view
        self.router = router
    }
}
