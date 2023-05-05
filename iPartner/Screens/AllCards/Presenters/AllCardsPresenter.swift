//
//  AllCardsPresenter.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import Foundation

final class AllCardsPresenter: AllCardsPresenterProtocol {

    private var cards = Cards()
    private var router: RouterProtocol?
    private weak var view: AllCardsViewProtocol?
    private let network = NetworkManager.shared
    private let cardsLimit = 6
    
    init(router: RouterProtocol, view: AllCardsViewProtocol) {
        self.view = view
        self.router = router
    }
    
    
    func getItemsCount() -> Int {
        return self.cards.count
    }
    
    func getNavigationTitle() -> String {
        return Resources.AllCardsScreen.navigationTitle
    }
    
    func getImageName(forCard id: Int) -> String {
        return Resources.AllCardsScreen.emptyImageName
    }
    
    func selectCard(at index: Int) {
        guard let id = cards[index].id else { return }
        router?.openCardDetailScreen(for: id)
    }
    
    func getCardName(at index: Int) -> String? {
        return cards[index].name
    }
    
    func getCardDescription(at index: Int) -> String? {
        return cards[index].description
    }
    
    func getCardImageName(at index: Int) -> String? {
        return cards[index].categories?.image
    }
        
    func searchCards(query: String) {
        network.fetchCards(offset: 0, limit: 4, search: query) { [self] result in
            switch result {
            case .success(let drugs):
                guard !drugs.isEmpty else { return }
                cards = drugs
        
                DispatchQueue.main.async { [self] in
                    view?.updateView()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func getCardsBy(offset: Int) {
        network.fetchCards(offset: offset, limit: cardsLimit) { [self] result in
            switch result {
            case .success(let drugs):
                guard !drugs.isEmpty else { return }
                cards.append(contentsOf: drugs)
                
                let startIndex = cards.count - drugs.count
                let endIndex = cards.count - 1
                let indexPaths = (startIndex...endIndex).map { IndexPath(row: $0, section: 0) }
                
                DispatchQueue.main.async { [self] in
                    view?.updateView(at: indexPaths)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
