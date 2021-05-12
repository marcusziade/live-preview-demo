//
//  ViewController.swift
//  live-preview-demo
//
//  Created by Marcus Ziadé on 11.5.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Types

    private enum Section {
        case numbers
    }

    // MARK: - Properties

    private var numbers = Array(1...100)
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil

    // MARK: - UI Components

    private let collectionView: UICollectionView = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("XD", comment: "")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        configureDataSource()
    }

    // MARK: - Methods

    private func configureDataSource() {

        let cellRegistration = UICollectionView.CellRegistration
        <UICollectionViewCell, Int> { cell, indexPath, item in
            var content = UIListContentConfiguration.subtitleCell()
            content.text = String(self.numbers[indexPath.row])
            content.image = UIImage(systemName: "dollarsign.circle")
            cell.contentConfiguration = content
            cell.backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, item -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.numbers])
        snapshot.appendItems(numbers)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

#if DEBUG

import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static var previews: some View = Preview(
        for: ViewController()
    )
}

#endif

