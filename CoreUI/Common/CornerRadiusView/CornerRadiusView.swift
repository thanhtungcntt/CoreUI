//
//  CornerRadiusView.swift
//  LiveRenderDemo
//
//  Created by Le Thanh Tung on 9/26/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@IBDesignable public class CornerRadiusView: UIView {

    @IBInspectable var bgColor           : UIColor      = UIColor.lightGray
    @IBInspectable var cornerRadius      : CGFloat      = 0.0
    @IBInspectable var cBotomLeft        : Bool         = false
    @IBInspectable var cBotomRight       : Bool         = false
    @IBInspectable var cTopLeft          : Bool         = false
    @IBInspectable var cTopRight         : Bool         = false
    
    private func customInit() {
        
        self.backgroundColor = bgColor
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [
                                    cBotomLeft  ? .bottomLeft  : UIRectCorner(rawValue: UInt(0.0)),
                                    cBotomRight ? .bottomRight : UIRectCorner(rawValue: UInt(0.0)),
                                    cTopLeft  ? .topLeft     : UIRectCorner(rawValue: UInt(0.0)),
                                    cTopRight ? .topRight    : UIRectCorner(rawValue: UInt(0.0))
                                                     ],
                                cornerRadii: CGSize(width: cornerRadius,
                                                    height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
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
