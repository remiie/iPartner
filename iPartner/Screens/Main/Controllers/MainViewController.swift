//
//  MainViewController.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    var titlelabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var iconImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    var showAllCardsButton: UIButton  = {
        let button = UIButton()
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension MainViewController: MainViewControllerProtocol {

    
    
}
