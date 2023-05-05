//
//  CardDetailPresenter.swift
//  iPartner
//
//  Created by Роман Васильев on 04.05.2023.
//

import UIKit
import Foundation

final class CardDetailPresenter: CardDetailPresenterProtocol {

    private weak var view: CardDetailViewProtocol?
    private var itemId: Int
    
    init(view: CardDetailViewProtocol, item: Int) {
        self.view = view
        self.itemId = item
    }
    
    func loadItem() {
        NetworkManager.shared.fetchItem(id: itemId) { result in
            switch result {
            case .success(let item):
                DispatchQueue.main.async { [self] in
                    view?.setCardTitle(item.name ?? " ")
                    view?.setCardDescription(item.description ?? " ")
                    view?.setCardImage(item.image ?? " ")
                    view?.setCompanyIcon(image: item.categories?.icon ?? " ")
                }
            case .failure(let error):
                print("erroe load item")
            }
        }
    }
    
}

/*
 

 
 */
