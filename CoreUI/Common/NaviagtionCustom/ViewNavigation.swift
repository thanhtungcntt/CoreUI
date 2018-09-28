//
//  ViewNaviation.swift
//  LiveRenderDemo
//
//  Created by Le Thanh Tung on 9/26/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc protocol ViewNavigationDelegate : class {
    @objc optional func onLeftAction()
    @objc optional func onRightAction()
}

@IBDesignable class ViewNavigation: UIView {
    
    static let className = "ViewNavigation"
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgAvatar: CircleImageView!
    @IBOutlet weak var btnLeftAction: UIButton!
    @IBOutlet weak var btnRightAction: UIButton!
    @IBOutlet weak var topViewNav: UIView!
    @IBOutlet weak var leftViewNav: CornerRadiusView!
    @IBOutlet weak var rightViewNav: CornerRadiusView!
    
    weak private var delegate : ViewNavigationDelegate?
    private let bundle = Bundle(for: ViewNavigation.self)

    
    @IBInspectable private var title          : String  = "title"
    @IBInspectable private var avatar         : UIImage?
    @IBInspectable private var leftActionImg  : UIImage?
    @IBInspectable private var rightActionImg : UIImage?
    @IBInspectable private var bgColorNav     : UIColor = UIColor.lightGray
    @IBInspectable private var shadowAvt      : Float   = 0.0
    @IBInspectable private var shadowAvtColor : UIColor = UIColor.lightGray
    
    public func setDelegate(_ viewController : UIViewController) { self.delegate = viewController as? ViewNavigationDelegate }
    
    public func setTitle(_ title : String) { self.lbTitle.text = title }
    
    private func customInit() {
        let view              = loadViewFromNib()
        view.frame            = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.setObject()
        addSubview(view)
    }
    
    private func setObject() {
        self.setTitle(title)
        if avatar != nil { self.imgAvatar.image = avatar }
        if leftActionImg != nil { self  .setLeftACtion() }
        if rightActionImg != nil { self.setRightAction() }
        self.setShadowAvatar()
        self.setBackgroundNav()
    }
    
    private func setBackgroundNav() {
        self.topViewNav.backgroundColor = bgColorNav
        self.leftViewNav.bgColor        = bgColorNav
        self.rightViewNav.bgColor       = bgColorNav
    }
    
    private func setShadowAvatar() {
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.shadowColor   = shadowAvtColor.cgColor
        imgAvatar.layer.shadowOffset  = .zero
        imgAvatar.layer.shadowOpacity = shadowAvt
        let rectShadow = CGRect.init(x: -2, y: 2, width: self.frame.width + 4, height: self.frame.height )
        imgAvatar.layer.shadowPath = UIBezierPath.init(rect: rectShadow).cgPath
        imgAvatar.layer.shouldRasterize = true
    }
    
    private func setRightAction() {
        btnRightAction.setImage(rightActionImg, for: .normal)
        btnRightAction.addTarget(self, action: #selector(onClickRightAction(sender:)), for: .touchUpInside)
    }
    
    private func setLeftACtion() {
        btnLeftAction.setImage(leftActionImg, for: .normal)
        btnLeftAction.addTarget(self, action: #selector(onClickLeftAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func onClickRightAction(sender : UIButton) {
        print("==================On click right action==================")
        if let myDelegate = delegate {
            myDelegate.onLeftAction!()
        }
    }
    
    @objc private func onClickLeftAction(sender : UIButton) {
        print("==================On click left action==================")
        if let myDelegate = delegate {
            myDelegate.onRightAction!()
        }
    }
    
    private func loadViewFromNib() -> UIView {
        let nib  = UINib(nibName: ViewNavigation.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customInit()
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
