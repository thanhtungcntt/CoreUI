//
//  BaseTableViewController.swift
//  CoreUI
//
//  Created by Le Thanh Tung on 8/8/18.
//  Copyright © 2018 Le Thanh Tung. All rights reserved.
//

import UIKit

@objc public protocol BaseTableViewDataSource : NSObjectProtocol {
    func setUpTableViewCell( _ tableView: UITableView,indexPath: IndexPath ) -> UITableViewCell
    func onRefeshData()
    func onLoadMore()
}

public class BaseTableViewController: BaseViewController {
    public var data: NSMutableArray?
    public var isPullToRefesh = false // default pull to refesh is false
    public var isLoadMore = false // default load more is false
    
    private var refreshControl : UIRefreshControl?
    private var spinner : UIActivityIndicatorView?
    public func registerNibTableViewCell() {}
    
}

extension BaseTableViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.setShowRefeshControll(tableView)
        
        if self.data == nil {
            return 0
        }
        
        refreshControl?.endRefreshing()
        spinner?.stopAnimating()
        return self.data!.count
    }
    
    private func setShowRefeshControll(_ tableView : UITableView) {
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action:
            #selector(self.onRefeshData),
                                 for: UIControlEvents.valueChanged)
        refreshControl?.tintColor = KColor.getColorRefeshControll()
        if isPullToRefesh {
            tableView.addSubview(refreshControl!)
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.setUpTableViewCell(tableView,indexPath: indexPath)
    }
}

extension BaseTableViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BaseTableViewController : BaseTableViewDataSource {
    public func setUpTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex
            && indexPath.row == lastRowIndex
            && isLoadMore
            && !(self.refreshControl?.isRefreshing)! {
            self.setShowSpinner(tableView)
            self.onLoadMore()
        }
    }
    
    private func setShowSpinner(_ tableView : UITableView ) {
        self.spinner = UIActivityIndicatorView()
        self.spinner?.activityIndicatorViewStyle = .whiteLarge
        self.spinner?.color = KColor.getColorLoadMoreControll()
        self.spinner?.backgroundColor = KColor.getColorWhite()
        self.spinner?.startAnimating()
        self.spinner?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView?.isHidden = false
        tableView.tableFooterView = spinner
    }
    
    public func onRefeshData() {
        refreshControl?.beginRefreshing()
        print("=============Refesh data=============")
    }
    
    public func onLoadMore() {
        print("=============Load more=============")
    }
}





