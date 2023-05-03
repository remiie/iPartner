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
    private var titleView: UILabel = {
        let label = UILabel()
        label.text = "Список"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let searchBar = UISearchBar()
    private let expandableView = ExpandableView()
    private var leftConstraint: NSLayoutConstraint!
    
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
        navigationController?.navigationBar.titleTextAttributes = condition ? [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ] : nil
    }
    
    func configureExpandableView() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        expandableView.addSubview(searchBar)
        leftConstraint = searchBar.leftAnchor.constraint(equalTo: expandableView.leftAnchor)
        leftConstraint.isActive = false
        searchBar.rightAnchor.constraint(equalTo: expandableView.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: expandableView.topAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: expandableView.bottomAnchor).isActive = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(toggleSearch))
    }
    
    fileprivate func configure() {
        view.backgroundColor = .systemGreen
        title = presenter?.getNavigationTitle()
        allCardsView.delegate = self
        view.addSubview(allCardsView)
        configureExpandableView()
        NSLayoutConstraint.activate([
            allCardsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            allCardsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            allCardsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allCardsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func toggleSearch() {
        
        navigationItem.titleView = expandableView
        navigationItem.titleView?.layoutIfNeeded()
        let isOpen = leftConstraint.isActive == true
        leftConstraint.isActive = isOpen ? false : true
        
        UIView.animate(withDuration: 1, animations: {
            self.navigationItem.titleView?.alpha = isOpen ? 0 : 1
            self.navigationItem.titleView?.layoutIfNeeded()
        })
        
        if isOpen { navigationItem.titleView = nil }
    }
    
}

extension AllCardsController: AllCardsViewDelegate {
    func selectCard(at index: Int) {
        print("select card at \(index)")
    }
    
    func getItemsCount() -> Int {
        return 10
    }
    
    func getCardData(at index: Int) -> CardData {
        let data = ("Title", "Description", UIImage(named: Resources.AllCardsScreen.emptyImageName))
        return data
    }
    func hideNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
}

class ExpandableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
}
