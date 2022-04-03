//
//  ViewConfiguration.swift
//  ModeloVIP
//
//  Created by José Júlio Júnior on 07/02/22.
//

import Foundation

protocol ScreenViewProtocol {
    func addViewHierarchy()
    func setupConstraints()
    func setupAdditional()
    func setupViews()
}

extension ScreenViewProtocol {
    func setupAdditional() {}
    
    func setupViews() {
        addViewHierarchy()
        setupConstraints()
        setupAdditional()
    }
    
}
