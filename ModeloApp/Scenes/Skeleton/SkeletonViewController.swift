//
//  SkeletonViewController.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

protocol SkeletonDisplayLogic: AnyObject {
    func displayScreenValues(viewModel: Skeleton.Model.ViewModel)
    func displayDados(viewModel: Skeleton.Model.ViewModel)
}

final class SkeletonViewController: UIViewController, SkeletonDisplayLogic {
    
    // MARK: - Archtecture Objects
    
    var interactor: SkeletonBusinessLogic?
    var router: (NSObjectProtocol & SkeletonRoutingLogic & SkeletonDataPassing)?
    
    var screenview: SkeletonView
    
    // MARK: - ViewController Lifecycle
    
    init(view: SkeletonView = SkeletonView()) {
        screenview = view
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        screenview = SkeletonView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        screenview = SkeletonView()
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
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = SkeletonInteractor()
        let presenter = SkeletonPresenter()
        let router = SkeletonRouter()
        
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
    
    // MARK: - Display Logic
    
    func displayScreenValues(viewModel: Skeleton.Model.ViewModel) {
        self.title = viewModel.title
        screenview.showLoading()
        interactor?.loadDados()
    }
    
    func displayDados(viewModel: Skeleton.Model.ViewModel) {
        screenview.setup(dados: viewModel.dados)
    }
}

extension SkeletonViewController: SkeletonViewDelegate {
    
}
