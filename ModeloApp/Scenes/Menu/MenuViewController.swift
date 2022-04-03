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
    
    var screenview: MenuView
    
    // MARK: - ViewController Lifecycle
    
    init(view: MenuView = MenuView()) {
        screenview = view
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        screenview = MenuView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        screenview = MenuView()
        super.init(coder: aDecoder)
        setup()
    }
    
    override func loadView() {
        screenview.delegate = self
        self.view = screenview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScreenValues()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.backButtonTitle = ""
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

extension MenuViewController: MenuViewDelegate {
    
    func didTapSkeletonView() {
        router?.routeToSkeletonView()
    }
}
