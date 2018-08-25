//
//  BaseViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/8/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

// MARK: Data source base view
@objc public protocol BaseViewDataSource : NSObjectProtocol {
    // to set uo data
    func initData()

    // to set up view
    func initView()

    // to set background color for status bar
    func setBackgroundStatusBar(_ color : UIColor, stausBarStyle : UIStatusBarStyle )
    
    // to set up navigation constructor
    func setupNavigation(_ nav : NavigationSettings)
    
    // event click left of navigation
    func leftAction()
    
    // event click right of navigation
    func rightAction()
    
    // optional func access not call to it
    @objc optional func checkConnectNextWork()
}

// MARK: BaseViewController
open class BaseViewController: UIViewController {
    weak open var dataSource : BaseViewDataSource?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.initView()
        self.initNavigation()
        self.setBackgroundStatusBar(KColor.getColorStatusBar(), stausBarStyle: .lightContent)
    }
    
    // setUp navigation
    private func initNavigation() {
        navigationController?.navigationBar.barTintColor = KColor.getColorNavigation()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    public func setupNavigation(_ nav: NavigationSettings) {
        title = nav.titleNavigation
        if nav.leftImage != nil {
            let backButton = UIButton(type: .custom)
            backButton.setImage(nav.leftImage, for: .normal)
            backButton.frame = CGRect(x: 0, y: 0, width: (nav.leftImage?.size.width)!, height: (nav.leftImage?.size.height)!)
            backButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 13)
            backButton.addTarget(self, action: #selector(self.leftAction), for: .touchUpInside)
            let leftButton = UIBarButtonItem(customView: backButton)
            navigationItem.setLeftBarButton(leftButton, animated: true)
        }
        if nav.leftTitle != nil {
            let backButton = UIButton(type: .custom)
            backButton.setTitle(nav.leftTitle, for: .normal)
            backButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 13)
            backButton.addTarget(self, action: #selector(self.leftAction), for: .touchUpInside)
            let leftButton = UIBarButtonItem(customView: backButton)
            navigationItem.setLeftBarButton(leftButton, animated: true)
        }
        if nav.rightImage != nil {
            let backButton = UIButton(type: .custom)
            backButton.setImage(nav.rightImage, for: .normal)
            backButton.frame = CGRect(x: 0, y: 0, width: (nav.leftImage?.size.width)!, height: (nav.leftImage?.size.height)!)
            backButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 0)
            backButton.addTarget(self, action: #selector(self.leftAction), for: .touchUpInside)
            let leftButton = UIBarButtonItem(customView: backButton)
            navigationItem.setRightBarButton(leftButton, animated: true)
        }
        if nav.rightTitle != nil {
            let backButton = UIButton(type: .custom)
            backButton.setTitle(nav.rightTitle, for: .normal)
            backButton.addTarget(self, action: #selector(self.leftAction), for: .touchUpInside)
            backButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 0)
            let leftButton = UIBarButtonItem(customView: backButton)
            navigationItem.setRightBarButton(leftButton, animated: true)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("==========Deinit from base view===========")
    }
}

// MARK: Extend base view override base view data source
extension BaseViewController :  BaseViewDataSource {
    public func initData() {}
    public func initView() {}
    
    public func leftAction() {
        print("==========Did tap left action===========")
    }
    
    public func rightAction() {
        print("==========Did tap right action===========")
    }
    
    public func setBackgroundStatusBar(_ color: UIColor, stausBarStyle: UIStatusBarStyle) {
        // set status bar style
        UIApplication.shared.statusBarStyle = stausBarStyle
        // set status bar bg color
        UIApplication.shared.statusBarView?.backgroundColor = color
    }
}




