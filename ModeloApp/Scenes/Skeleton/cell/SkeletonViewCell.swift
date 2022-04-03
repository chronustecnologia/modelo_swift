//
//  SkeletonViewCell.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import Foundation
import UIKit

final class SkeletonViewCell: UITableViewCell {
    
    static let identifier = "SkeletonViewCellIdentifier"
    
    private lazy var modeloCell: ModeloCell = {
        let view = ModeloCell()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dados: Skeleton.Model.Response) {
        modeloCell.setup(title: dados.title, subtitle: dados.subtitle, image: dados.image)
    }
}

extension SkeletonViewCell: ScreenViewProtocol {
    
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
    }
    
}
