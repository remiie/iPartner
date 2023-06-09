//
//  Resources.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import Foundation

struct Resources {
    static var cardsLimit: Int = 6
    enum MainScreen {
        static var mainTitle: String = "Добро пожаловать!"
        static var iconImageName: String = "welcome_icon"
        static var showAllCardsButtonTitle: String = "Продолжить"
    }
    
    enum AllCardsScreen {
        static var navigationTitle: String = "Список"
        static var emptyImageName: String = "empty_image"
    }
    
    enum CardView {
        static var buyButtonImageName: String = "location_icon"
        static var favoritesButtonImageName: String = "favorites_image"
    }
    
    
}
