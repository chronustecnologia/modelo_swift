//
//  SkeletonViewCell2.swift
//  ModeloApp
//
//  Created by José Júlio on 03/04/22.
//

import Foundation
import UIKit

final class SkeletonViewCell2: UICollectionViewCell {
    
    static let identifier = "SkeletonViewCell2Identifier"
    
    private lazy var modeloCell: ModeloCell2 = {
        let view = ModeloCell2()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dados: Skeleton.Model.Response) {
        modeloCell.setup(title: dados.title, subtitle: dados.subtitle, image: dados.image)
    }
}

extension SkeletonViewCell2: ScreenViewProtocol {
    
    func addViewHierarchy() {
        contentView.addSubview(modeloCell)
    }
    
    func setupConstraints() {
        modeloCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditional() {
        self.isSkeletonable = true
        self.backgroundColor = .red
    }
}
