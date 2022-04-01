//
//  MenuPresenter.swift
//  ModeloApp
//
//  Created by José Júlio Júnior on 01/04/22.
//

import UIKit

protocol MenuPresentationLogic {
    func presentScreenValues()
}

final class MenuPresenter: MenuPresentationLogic {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: MenuDisplayLogic?
    
    // MARK: - Presentation Logic
    
    func presentScreenValues() {
        let viewModel = Menu.Model.ViewModel(title: MenuKeys.Localized.title.string())
        viewController?.displayScreenValues(viewModel: viewModel)
    }
}
