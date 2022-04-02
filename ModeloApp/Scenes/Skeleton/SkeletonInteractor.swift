//
//  SkeletonInteractor.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

protocol SkeletonBusinessLogic {
    func loadScreenValues()
    func loadDados()
}

protocol SkeletonDataStore {
    // var name: String { get set }
}

final class SkeletonInteractor: SkeletonBusinessLogic, SkeletonDataStore {
    
    // MARK: - Archtecture Objects
    
    var presenter: SkeletonPresentationLogic?
    let worker: SkeletonWorkerLogic
    
    // MARK: - DataStore Objects
    
    // var name: String = ""
    
    // MARK: - Interactor Lifecycle
    
    init(worker: SkeletonWorkerLogic = SkeletonWorker()) {
        self.worker = worker
    }
    
    // MARK: - Business Logic
    
    func loadScreenValues() {
        presenter?.presentScreenValues()
    }
    
    func loadDados() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            var response = [Skeleton.Model.Response]()
            response.append(Skeleton.Model.Response(title: "Titulo 1", subtitle: "Subtitulo", image: "image1"))
            response.append(Skeleton.Model.Response(title: "Titulo 2", subtitle: "Subtitulo", image: "image1"))
            self.presenter?.presentDados(response: response)
        }
    }
}
