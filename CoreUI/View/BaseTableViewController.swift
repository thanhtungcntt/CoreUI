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
    func onLoadMore()
    func endLoadMore()
    func setUpNibTableView(_ tableView : UITableView)
}

class BaseTableViewController: BaseViewController {
    public var data: NSMutableArray?
    public var isPullToRefesh = false // default pull to refesh is false
    public var isLoadMore = false // default load more is false
    
    private var countData = 1 // default count data is zero
    private var spinnerLoadmore : NVActivityIndicatorView!
    
    public func registerNibCellTableview(_ tableView : UITableView, nameCell : String) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        let bundle = Bundle(for: type(of: self))
        let cellNib = UINib.init(nibName: nameCell, bundle: bundle)
        tableView.register(cellNib, forCellReuseIdentifier: nameCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension BaseTableViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.backgroundView = nil
        
        if self.data == nil {
            return 0
        }
        
        if self.data?.count == 0 {
            let view = self.showEmptyPageView()
            view.frame = CGRect.zero
            tableView.backgroundView = view
        }
        
        if countData == self.data!.count {
            countData = 0
        } else {
            countData = (self.data?.count)!
        }
        
        self.spinnerLoadmore?.stopAnimating()
        tableView.tableFooterView?.isHidden = true
        return self.data!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.setUpTableViewCell(tableView,indexPath: indexPath)
    }
    
    public func setUpNibTableView(_ tableView : UITableView) {
    }
    
    // MARK: -  check show empty page
    public func showEmptyPageView() -> UIView {
        let emptyPage = EmtyPagerView.init(frame: UIScreen.main.bounds)
        emptyPage.delegate = self
        return emptyPage
    }
}

extension BaseTableViewController : EmtyPagerViewDelegate {
    //MARK: - Action when click on empty page
    @objc open func onRefeshDataEmptyPage() {
        initData()
        print("==========On click empty data!==========") }
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
            && indexPath.row == lastRowIndex && isLoadMore {
            self.setShowSpinner(tableView)
            self.onLoadMore()
        }
    }
    
    private func setShowSpinner(_ tableView : UITableView ) {
        if isLoadMore && countData != 0 {
            let frameSpinner = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(50))
            self.spinnerLoadmore = NVActivityIndicatorView(frame: frameSpinner, color: KColor.getColorLoadMoreControll(), padding: 10)
            self.spinnerLoadmore.startAnimating()
            tableView.tableFooterView?.isHidden = false
            tableView.tableFooterView = self.spinnerLoadmore
            countData = self.data!.count
            self.onLoadMore()
        } else {
            self.spinnerLoadmore.stopAnimating()
            tableView.tableFooterView = nil
            self.endLoadMore()
        }
    }
    
    public func onLoadMore() {
        print("=============Load more=============")
    }
    
    public func endLoadMore() {
        print("=============End Load more=============")
    }
}





