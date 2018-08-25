//
//  UIBaseCollectionViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/24/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc public protocol BaseCollectionViewDataSource : NSObjectProtocol {
    var data : NSMutableArray { get set }
    func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

public class BaseCollectionViewController: BaseViewController {
    public func registerNibCollectionViewCell() {}
}

extension BaseCollectionViewController : BaseCollectionViewDataSource {
    
    public var data: NSMutableArray {
        get { return self.data }
        set { self.data = newValue }
    }
    
    public func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell.init()
    }
}

extension BaseCollectionViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.setUpCell(collectionView,indexPath:indexPath)
    }
}
