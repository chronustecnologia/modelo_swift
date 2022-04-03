//
//  SkeletonView.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit
import SkeletonView

protocol SkeletonViewDelegate: AnyObject {
    func didTapTableView(_ index: Int)
}

final class SkeletonView: UIView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(SkeletonViewCell.self, forCellReuseIdentifier: SkeletonViewCell.identifier)
        view.rowHeight = UITableView.automaticDimension
        view.isSkeletonable = true
        return view
    }()
    
    weak var delegate: SkeletonViewDelegate?
    
    var dados: [Skeleton.Model.Response]?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dados: [Skeleton.Model.Response]) {
        self.dados = dados
        tableView.reloadData()
        tableView.hideSkeleton()
    }
    
    func showLoading() {
        tableView.reloadData()
        tableView.showAnimatedGradientSkeleton()
    }
}

extension SkeletonView: ScreenViewProtocol {
    
    func addViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupAdditional() {
        backgroundColor = .white
    }
    
}

extension SkeletonView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dados = dados {
            return dados.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonViewCell.identifier, for: indexPath) as? SkeletonViewCell else { return UITableViewCell() }
        if let dados = dados {
            cell.setup(dados: dados[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTapTableView(indexPath.row)
    }
}

extension SkeletonView: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return SkeletonViewCell.identifier
    }
}
