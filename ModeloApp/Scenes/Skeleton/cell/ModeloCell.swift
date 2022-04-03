//
//  ModelCell.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

protocol ModeloCellDelegate: AnyObject {
    
}

final class ModeloCell: UIView {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.textColor = .black
        view.text = " "
        view.isSkeletonable = true
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = .black
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
    
    weak var delegate: ModeloCellDelegate?
    
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

extension ModeloCell: ScreenViewProtocol {
    
    func addViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalTo(imageView.snp.trailing).inset(-8)
            make.trailing.equalToSuperview().inset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.leading.equalTo(imageView.snp.trailing).inset(-8)
            make.trailing.equalToSuperview().inset(12)
        }
    }
    
    func setupAdditional() {
        self.backgroundColor = .clear
        self.isSkeletonable = true
    }
    
}

