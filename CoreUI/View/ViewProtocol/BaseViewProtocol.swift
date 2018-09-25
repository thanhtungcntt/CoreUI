//
//  BaseViewProtocol.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 9/25/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

// MARK: Data source base view
@objc public protocol BaseViewProtocol : NSObjectProtocol {
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
