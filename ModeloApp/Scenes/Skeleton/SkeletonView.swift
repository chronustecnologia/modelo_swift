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
    func didTapCollectionview(_ index: Int)
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
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        view.dataSource = self
        view.delegate = self
        view.register(SkeletonViewCell2.self, forCellWithReuseIdentifier: SkeletonViewCell2.identifier)
        view.showsHorizontalScrollIndicator = false
        view.delaysContentTouches = false
        view.allowsSelection = true
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
        
        collectionView.reloadData()
        collectionView.hideSkeleton()
    }
    
    func showLoading() {
        tableView.reloadData()
        tableView.showAnimatedGradientSkeleton()
        
        collectionView.reloadData()
        collectionView.showAnimatedGradientSkeleton()
    }
}

extension SkeletonView: ScreenViewProtocol {
    
    func addViewHierarchy() {
        addSubview(tableView)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(300)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).inset(-8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupAdditional() {
        backgroundColor = .white
        
        let viewFlowLayout: UICollectionViewFlowLayout = {
            let view = UICollectionViewFlowLayout.init()
            view.scrollDirection = .vertical
            view.minimumInteritemSpacing = 5
            view.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
            view.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200.0)
            return view
        }()
        collectionView.setCollectionViewLayout(viewFlowLayout, animated: true)
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

extension SkeletonView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dados = dados {
            return dados.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkeletonViewCell2.identifier, for: indexPath) as? SkeletonViewCell2 else { return UICollectionViewCell() }
        if let dados = dados {
            cell.setup(dados: dados[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTapCollectionview(indexPath.row)
    }
}

extension SkeletonView: SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return SkeletonViewCell2.identifier
    }
    
}
