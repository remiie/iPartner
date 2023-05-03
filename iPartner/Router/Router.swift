//
//  Router.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

final class Router: RouterProtocol {
    
    private var navigation: UINavigationController

    init(navigation: UINavigationController = UINavigationController()) {
        self.navigation = navigation
    }
    
    func prepareInitialScreen() -> UIViewController {
        let mainController = MainController()
        let mainPresenter = MainPresenter(router: self, view: mainController.mainView)
        mainController.presenter = mainPresenter
        navigation.viewControllers = [mainController]
        return navigation
    }
    
    
    
}
