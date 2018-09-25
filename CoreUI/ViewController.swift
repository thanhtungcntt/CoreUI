//
//  ViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/8/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

class ViewController: BaseCollectionViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func initView() {        
        self.registerNibCollectionViewCell(self.collectionView, nameNib: "TestCell")
    }
    
    override func initData() {
        self.data = NSMutableArray.init()
        self.data?.addObjects(from: [1,2,3,4,5,6,7])
        self.collectionView.reloadData()
    }
    
    override func setUpCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? TestCell {
            if let text = self.data![indexPath.row] as? Int {
                cell.lbNumber.text = "\(text)"
            }
            return cell
        }
        return UICollectionViewCell()
    }
 
}

