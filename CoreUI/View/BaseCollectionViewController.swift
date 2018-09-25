//
//  UIBaseCollectionViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/24/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc public protocol BaseCollectionViewDataSource : NSObjectProtocol {
    func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

public class BaseCollectionViewController: BaseViewController {
    public var data: NSMutableArray?

    public func registerNibCollectionViewCell(_ collectionView : UICollectionView, nameNib : String) {
        collectionView.register(UINib(nibName: nameNib, bundle: nil), forCellWithReuseIdentifier: nameNib)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension BaseCollectionViewController : BaseCollectionViewDataSource {
    public func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell.init()
    }
}

extension BaseCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data!.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.setUpCell(collectionView,indexPath:indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}
