//
//  ViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/8/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController {

    @IBOutlet weak var tableView: UITableView!

    override func initView() {
        let nav = NavigationSettings(backButtonAndNavigationTitle: "Title")
        self.setupNavigation(nav)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.isPullToRefesh = true
        self.isLoadMore = true
    }
    
    override func initData() {
        self.data = NSMutableArray.init()
        for i in 0..<15 {
            self.data?.add("\(i + 1)")
        }
        self.tableView.reloadData()
    }
    
    override func setUpTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let textString = self.data?[indexPath.row] as? String {
            cell.textLabel?.text = textString
        }
        return cell
    }
    
    override func onLoadMore() {
    }
    
    override func onRefeshData() {
        initData()
    }
}

