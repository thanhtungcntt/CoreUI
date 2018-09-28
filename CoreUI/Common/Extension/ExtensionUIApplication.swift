//
//  ExtensionUIApplication.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/24/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

public extension UIApplication {
    public var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
