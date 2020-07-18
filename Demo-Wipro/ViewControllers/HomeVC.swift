//
//  HomeVC.swift
//  Demo-Wipro
//
//  Created by Vineeta on 18/07/20.
//  Copyright © 2020 Vineeta. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataRowArray: [Rows]?
    var refreshControl = UIRefreshControl()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: Any) {
        //  your code to reload tableView
        initialSetup()
        refreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialSetup()
    }
    
    func initialSetup() {
        appDelegate.showLoadingView()
        DataManager.sharedInstance.getDataForRow { [weak self] (error, model) in
            self?.dataRowArray = model?.rows
            DispatchQueue.main.async {
                self?.title = model?.title ?? ""
                self?.appDelegate.hideLoadingView()
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arr = dataRowArray {
            return arr.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell {
            if let arr = dataRowArray {
                cell.configureCell(data: arr[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
}
