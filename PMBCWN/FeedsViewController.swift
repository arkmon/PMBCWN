//
//  ExpensesViewController.swift
//  money
//
//  Created by Dowejko on 04/02/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit

final class FeedsViewController: UIViewController {
    
    var viewModel = FeedTableViewModel()
    @IBOutlet var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "RSSFeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RSSFeedTableViewCell")
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(FeedsViewController.refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.startFeed()
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
    }
    func refresh() {
        viewModel.startFeed()
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - TableViewDelegates

extension FeedsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSFeedTableViewCell", for: indexPath) as! RSSFeedTableViewCell
        let expenseCellModel = viewModel.cellViewModel(at: indexPath)
        
        cell.setupWithCellViewModel(cellViewModel: expenseCellModel)
        
        return cell
    }
}

extension FeedsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRow(at: indexPath)
    }
    
}

