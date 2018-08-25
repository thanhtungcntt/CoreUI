//
//  KColor.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/24/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

public class KColor: NSObject {
    public static func getColorNavigation() -> UIColor { return UIColor().HexToColor(hexString: "#1E90FF") }
    public static func getColorStatusBar() -> UIColor { return UIColor().HexToColor(hexString: "#6495ED") }
    public static func getColorRefeshControll() -> UIColor { return UIColor().HexToColor(hexString: "#1E90FF") }
    public static func getColorLoadMoreControll() -> UIColor { return UIColor().HexToColor(hexString: "#1E90FF") }
    public static func getColorWhite() -> UIColor { return UIColor.white }
}
