//
//  RouterProtocol.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

protocol RouterProtocol: AnyObject {
    func prepareInitialScreen() -> UIViewController
    func openAllCardsScreen()
    func openCardDetailScreen(for id: Int)
}
