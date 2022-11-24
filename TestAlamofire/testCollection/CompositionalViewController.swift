//
//  CompositionalViewController.swift
//  TestAlamofire
//
//  Created by Qingsong Chen on 2022/11/24.
//

import UIKit

class CompositionalViewController: UIViewController {
    
    struct Item: Hashable {
        let id = UUID()
    }
    
    enum Section {
        case all
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var layout: UICollectionViewCompositionalLayout!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        setupLayout()
        setupDataSoure()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.all])
        snapshot.appendItems(generateItems(count: 20), toSection: .all)
        dataSource.apply(snapshot)
        
    }
    
    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    

    
    func generateLayout() -> UICollectionViewCompositionalLayout {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2 / 3), heightDimension: .fractionalWidth(2 / 3))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)

        //MARK: -
        let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        let trailingGroupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 3), heightDimension: .fractionalWidth(2 / 3))
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupLayoutSize, subitems: [trailingItem])

        let leadingGroupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(2 / 3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: leadingGroupLayoutSize, subitems: [item, trailingGroup])
//        group.interItemSpacing = .fixed(10)

        let threeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 3), heightDimension: .fractionalWidth(1 / 3))
        let threeItem = NSCollectionLayoutItem(layoutSize: threeItemSize)
        let threeGroupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1 / 3))
        let threeGroup = NSCollectionLayoutGroup.horizontal(layoutSize: threeGroupLayoutSize, subitems: [threeItem])
        
        //MARK: -
        let bottomItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
//        let bottomItem = NSCollectionLayoutItem(layoutSize: bottomItemSize)
//        let bottomGroupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(2 / 3))
        
        let bottomGroup = NSCollectionLayoutGroup.vertical(layoutSize: bottomItemSize, subitems: [group, threeGroup])


        let section = NSCollectionLayoutSection(group: bottomGroup)
//        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)

       return layout
    }
    
        func setupDataSoure() {
            let cellRegistration = UICollectionView.CellRegistration<CompositionalCollectionViewCell, Item> { cell, indexPath, withIdentifier in
                cell.contentView.backgroundColor = UIColor.random

            }
    
            let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, withIdentifier in
                collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: withIdentifier)
            }
    
            self.dataSource = dataSource
        }
    
        func generateItems(count: Int) -> [Item] {
            var items: [Item] = []
            for _ in 0..<count {
                items.append(Item())
            }
            return items
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    enum Section {
//        case all
//    }
//
//    struct Item: Hashable {
//        let id = UUID()
//    }
//
//    var collectionViewLayout: UICollectionViewCompositionalLayout!
//    var collectionViewDatasource: UICollectionViewDiffableDataSource<Section, Item>!
//    var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
//        view.addSubview(collectionView)
//        setupLayout()
//        setupDataSoure()
//        collectionView.backgroundColor = .systemPink
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.all])
//        snapshot.appendItems(generateItems(count: 20), toSection: .all)
//        collectionViewDatasource.apply(snapshot)
//    }
//
//
//    func setupLayout() {
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//
//    func generateLayout() -> UICollectionViewCompositionalLayout {
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
//            let itemWidth = (environment.container.contentSize.width - 40) / 3
//            let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemWidth))
//            let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
//
//            let groupLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(itemWidth))
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitems: [item])
//            group.interItemSpacing = .fixed(10)
//
//            let section = NSCollectionLayoutSection(group: group)
//            section.interGroupSpacing = 10
//            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
//
//            return section
//        }
//
//        return layout
//    }
//
//
//    func setupDataSoure() {
//        let cellRegistration = UICollectionView.CellRegistration<CompositionalCollectionViewCell, Item> { cell, indexPath, withIdentifier in
//            cell.contentView.backgroundColor = .black
//        }
//
//        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, withIdentifier in
//            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: withIdentifier)
//        }
//
//        self.collectionViewDatasource = dataSource
//    }
//
//    func generateItems(count: Int) -> [Item] {
//        var items: [Item] = []
//        for _ in 0..<count {
//            items.append(Item())
//        }
//        return items
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    
    static var random: UIColor {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return UIColor(red: red, green: green, blue: blue)!
    }
    
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
}
