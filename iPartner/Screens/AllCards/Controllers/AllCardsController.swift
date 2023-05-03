//
//  AllCardsController.swift
//  iPartner
//
//  Created by Роман Васильев on 03.05.2023.
//

import UIKit

final class AllCardsController: UIViewController, AllCardsControllerProtocol {
    var presenter: AllCardsPresenterProtocol?
    var allCardsView: AllCardsViewProtocol = {
        let view = AllCardsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        colorizeNavBar(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        colorizeNavBar(false)
    }
    
    func colorizeNavBar(_ condition: Bool) {
        
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.tintColor = condition ? .white : .black
        navigationController?.navigationBar.backgroundColor = condition ? .systemGreen : .clear
        navigationController?.navigationBar.titleTextAttributes = condition ? [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ] : nil
    }
    fileprivate func configure() {
        view.backgroundColor = .systemGreen
        title = presenter?.getNavigationTitle()
        allCardsView.delegate = self
        view.addSubview(allCardsView)
       
        NSLayoutConstraint.activate([
            allCardsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            allCardsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            allCardsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allCardsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension AllCardsController: AllCardsViewDelegate {
    func selectCard(at index: Int) {
        print("select card at \(index)")
    }
    
    func getItemsCount() -> Int {
        return 2
    }
    
    func getCardData(at index: Int) -> CardData {
        let data = ("Title", "Description", UIImage(named: Resources.AllCardsScreen.emptyImageName))
        return data
    }
    
    
}