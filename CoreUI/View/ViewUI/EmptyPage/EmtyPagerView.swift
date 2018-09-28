//
//  EmtyPagerView.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 6/10/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit
public protocol EmtyPagerViewDelegate : class {
    func onRefeshDataEmptyPage()
}

open class EmtyPagerView: UIView {

    @IBOutlet weak var imgNodata: UIImageView!
    @IBOutlet weak var lbTitleNodata: UILabel!
    @IBOutlet weak var lbMsgNodata: UILabel!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet var contentVIew: UIView!
    public weak var delegate : EmtyPagerViewDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("==========init(coder:) has not been implemented==========")
    }
    
    deinit {
        print("==========Memory has been release!==========")
    }
    
    @IBAction func didTapRefeshData(_ sender: Any) {
        if delegate != nil {
            self.delegate?.onRefeshDataEmptyPage()
        }
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: EmtyPagerView.self)
        bundle.loadNibNamed("EmtyPagerView", owner: self, options: nil)
//        Bundle.main.loadNibNamed("EmtyPagerView", owner: self, options: nil)
        addSubview(contentVIew)
        contentVIew.frame = self.bounds
        contentVIew.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.btnUpdate.layer.cornerRadius = self.btnUpdate.frame.height / 2
    }
}
