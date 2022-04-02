//
//  SkeletonPresenter.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

protocol SkeletonPresentationLogic {
    func presentScreenValues()
    func presentDados(response: [Skeleton.Model.Response])
}

final class SkeletonPresenter: SkeletonPresentationLogic {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: SkeletonDisplayLogic?
    
    // MARK: - Presentation Logic
    
    func presentScreenValues() {
        let viewModel = Skeleton.Model.ViewModel(title: SkeletonKeys.Localized.title.string(), dados: [Skeleton.Model.Response]())
        viewController?.displayScreenValues(viewModel: viewModel)
    }
    
    func presentDados(response: [Skeleton.Model.Response]) {
        let viewModel = Skeleton.Model.ViewModel(title: "", dados: response)
        viewController?.displayDados(viewModel: viewModel)
    }
}
