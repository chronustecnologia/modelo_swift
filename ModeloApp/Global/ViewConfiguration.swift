//
//  ViewConfiguration.swift
//  ModeloVIP
//
//  Created by José Júlio Júnior on 07/02/22.
//

import Foundation

protocol ViewConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configViews()
}

extension ViewConfiguration {
    
    func setupViews() {
        buildHierarchy()
        setupConstraints()
        configViews()
    }
    
}
