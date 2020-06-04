//
//  ManagerSpecialTableViewController.swift
//  PrestoQ_Assignment
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import UIKit
import os.log

final class ManagerSpecialTableViewController: UITableViewController {
    private var managerSpecialViewModel: ManagerSpecialsViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Manager's Special".localized(withComment: "Title for the controller")
        getManagersSpecialProducts()
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        self.refreshControl = UIRefreshControl()
        let copy = "Pull to refresh".localized(withComment: "Copy to show when table view is pulled to refresh")
        self.refreshControl?.attributedTitle = NSAttributedString(string: copy)
        self.refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func refresh(sender:AnyObject) {
        getManagersSpecialProducts()
    }
        
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        tableView.reloadData()
    }
    
    // MARK: - TableView Data source and delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managerSpecialViewModel?.rowViewModel.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let rowModel = managerSpecialViewModel?.rowViewModel[indexPath.row] else { return cell }
        if let productCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductTableViewCell {
            productCell.configure(rowModel: rowModel)
            cell = productCell
        }
        
        cell.backgroundColor = .systemGray6
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Fetch Manager's Specials
    private func getManagersSpecialProducts() {
        let serviceManager = ServiceManager()
        serviceManager.getManagerSpecials { [weak self] (response) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.refreshControl?.endRefreshing()
                switch response {
                case .success(let managerSpecialViewModel):
                    strongSelf.managerSpecialViewModel = managerSpecialViewModel
                case .failure(let error):
                    os_log("error occoured %@", error.localizedDescription)
                }
            }
        }
    }
}
