//
//  MenuView.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

protocol MenuViewDelegate: AnyObject {
    func didTapSkeletonView()
}

final class MenuView: UIView {
    
    private lazy var buttonSkeleton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitle(MenuKeys.Localized.buttonSkeleton.string(), for: .normal)
        view.titleLabel?.textColor = .white
        view.addTarget(self, action: #selector(didTapSkeletonView), for: .touchUpInside)
        view.isHidden = !PropertyInfoService.shared.bool(key: "showSkeletonView")
        return view
    }()
    
    weak var delegate: MenuViewDelegate?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapSkeletonView() {
        delegate?.didTapSkeletonView()
    }
}

extension MenuView: ScreenViewProtocol {
    
    func addViewHierarchy() {
        addSubview(buttonSkeleton)
    }
    
    func setupConstraints() {
        buttonSkeleton.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(8)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(8)
            make.height.equalTo(38)
        }
    }
    
    func setupAdditional() {
        backgroundColor = .white
    }
}

