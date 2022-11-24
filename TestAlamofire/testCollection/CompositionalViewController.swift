//
//  CompositionalViewController.swift
//  TestAlamofire
//
//  Created by Qingsong Chen on 2022/11/24.
//

import UIKit

class CompositionalViewController: UIViewController {
    
    enum Section {
        case all
    }
    
    struct Item: Hashable {
        let id = UUID()
    }
    
    var collectionViewLayout: UICollectionViewCompositionalLayout!
    var collectionViewDatasource: UICollectionViewDiffableDataSource<Section, Item>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        setupLayout()
        setupDataSoure()
        collectionView.backgroundColor = .systemPink
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.all])
        snapshot.appendItems(generateItems(count: 20), toSection: .all)
        collectionViewDatasource.apply(snapshot)
    }
    
    
    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func generateLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            let itemWidth = (environment.container.contentSize.width - 40) / 3
            let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemWidth))
            let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
            
            let groupLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(itemWidth))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitems: [item])
            group.interItemSpacing = .fixed(10)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            return section
        }
        
        return layout
    }
    
    
    func setupDataSoure() {
        let cellRegistration = UICollectionView.CellRegistration<CompositionalCollectionViewCell, Item> { cell, indexPath, withIdentifier in
            cell.contentView.backgroundColor = .black
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, withIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: withIdentifier)
        }
        
        self.collectionViewDatasource = dataSource
    }
    
    func generateItems(count: Int) -> [Item] {
        var items: [Item] = []
        for _ in 0..<count {
            items.append(Item())
        }
        return items
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
