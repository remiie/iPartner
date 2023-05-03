//
//  MainControllerProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol MainControllerProtocol: AnyObject {
    var mainView: MainViewProtocol { get }
    var presenter: MainPresenterProtocol? { get set }
}
