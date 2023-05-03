//
//  AllCardsPresenter.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import Foundation

final class AllCardsPresenter: AllCardsPresenterProtocol {
    func getNavigationTitle() -> String {
        return Resources.AllCardsScreen.navigationTitle
    }
    
    func getImageName(forCard id: Int) -> String {
        return Resources.AllCardsScreen.emptyImageName
    }
    
    func selectCard(at index: Int) {
        router?.openCardDetailScreen()
    }
    
    
    private var router: RouterProtocol?
    private weak var view: AllCardsViewProtocol?
    
    init(router: RouterProtocol, view: AllCardsViewProtocol) {
        self.view = view
        self.router = router
    }
    
}
