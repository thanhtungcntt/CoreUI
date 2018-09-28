//
//  CircleImageView.swift
//  LiveRenderDemo
//
//  Created by Le Thanh Tung on 9/27/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@IBDesignable public class CircleImageView: UIImageView {
    
    @IBInspectable var borderCorlor : UIColor    = UIColor.lightGray
    @IBInspectable var borderWidth  : CGFloat    = 0.0
    @IBInspectable var bgColor      : UIColor    = UIColor.lightGray
    
    private func customInit(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderCorlor.cgColor
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        customInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
