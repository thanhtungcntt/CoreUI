//
//  BaseCollectionViewProtocol.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 9/26/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc public protocol BaseCollectionViewProtocol : NSObjectProtocol {
    func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func onLoadMore()
}
