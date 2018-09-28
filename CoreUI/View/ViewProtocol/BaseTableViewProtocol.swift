//
//  BaseTableViewProtocol.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 9/25/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc public protocol BaseTableViewProtocol : NSObjectProtocol {
    func setUpTableViewCell( _ tableView: UITableView,indexPath: IndexPath ) -> UITableViewCell
    func onLoadMore()
    func endLoadMore()
    func onRefeshDataEmptyPage()
    func showEmptyPageView() -> UIView
}
