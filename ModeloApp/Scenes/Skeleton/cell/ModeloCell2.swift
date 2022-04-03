//
//  ModeloCell2.swift
//  ModeloApp
//
//  Created by José Júlio on 03/04/22.
//

import Foundation

import UIKit

protocol ModeloCell2Delegate: AnyObject {
    
}

final class ModeloCell2: UIView {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont.boldSystemFont(ofSize: 14)
        view.textColor = .black
        view.textAlignment = .center
        view.text = " "
        view.isSkeletonable = true
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont.systemFont(ofSize: 12)
        view.textColor = .black
        view.textAlignment = .center
        view.text = " "
        view.isSkeletonable = true
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.isSkeletonable = true
        return view
    }()
    
    weak var delegate: ModeloCell2Delegate?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, subtitle: String, image: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = UIImage(named: image)
    }
}

extension ModeloCell2: ScreenViewProtocol {
    
    func addViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(4)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(4)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(4)
        }
    }
    
    func setupAdditional() {
        self.backgroundColor = .clear
        self.isSkeletonable = true
    }
    
}

