//
//  UIBaseCollectionViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/24/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

public class BaseCollectionViewController: BaseViewController, BaseCollectionViewProtocol {
    public var data: NSMutableArray?

    public func registerNibCollectionViewCell(_ collectionView : UICollectionView, nameNib : String) {
        collectionView.register(UINib(nibName: nameNib, bundle: nil), forCellWithReuseIdentifier: nameNib)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension BaseCollectionViewController {
    public func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell.init()
    }
}

extension BaseCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data!.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.setUpCell(collectionView,indexPath:indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastSectionIndex = collectionView.numberOfSections - 1
        let lastRowIndex = collectionView.numberOfItems(inSection: lastSectionIndex) - 1
        if indexPath.item == lastRowIndex {
            self.onLoadMore()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("aaaaa")
        return UICollectionReusableView()
    }
    
    public func onLoadMore() {
        print("=============Load more=============")
    }
}
