//
//  MenuViewController.swift
//  ModeloApp
//
//  Created by José Júlio Júnior on 01/04/22.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
    func displayScreenValues(viewModel: Menu.Model.ViewModel)
}

final class MenuViewController: UIViewController {
    
    // MARK: - Archtecture Objects
    
    var interactor: MenuBusinessLogic?
    var router: (MenuRoutingLogic & MenuDataPassing)?
    
    // MARK: - ViewController Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScreenValues()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = MenuInteractor()
        let presenter = MenuPresenter()
        let router = MenuRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Private Functions
    
    private func loadScreenValues() {
        interactor?.loadScreenValues()
    }
    
}

// MARK: - Display Logic

extension MenuViewController: MenuDisplayLogic {
    
    func displayScreenValues(viewModel: Menu.Model.ViewModel) {
        self.title = viewModel.title
    }
}
