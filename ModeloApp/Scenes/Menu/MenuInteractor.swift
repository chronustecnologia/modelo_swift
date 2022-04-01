//
//  MenuInteractor.swift
//  ModeloApp
//
//  Created by José Júlio Júnior on 01/04/22.
//

import UIKit

protocol MenuBusinessLogic {
    func loadScreenValues()
}

protocol MenuDataStore {
    // var name: String { get set }
}

final class MenuInteractor: MenuBusinessLogic, MenuDataStore {
    
    // MARK: - Archtecture Objects
    
    var presenter: MenuPresentationLogic?
    let worker: MenuWorkerLogic
    
    // MARK: - DataStore Objects
    
    // var name: String = ""
    
    // MARK: - Interactor Lifecycle
    
    init(worker: MenuWorkerLogic = MenuWorker()) {
        self.worker = worker
    }
    
    // MARK: - Business Logic
    
    func loadScreenValues() {
        presenter?.presentScreenValues()
    }
}
