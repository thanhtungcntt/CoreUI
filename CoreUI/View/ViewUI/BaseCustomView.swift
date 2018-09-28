//
//  BaseCustomView.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 9/26/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

protocol BaseCustomViewProtocol {
    func customInit()
}

class BaseCustomView: UIView, BaseCustomViewProtocol {

    override private init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func customInit() {
        
    }
}
