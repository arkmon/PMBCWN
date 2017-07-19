//
//  SideMenuTableView.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 11/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableView: UITableViewController {
    
    let viewModel = SideMenuTableViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nib = UINib(nibName: "EntryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EntryTableViewCell")
        viewModel.startFeed()
        
       
        
        DispatchQueue.main.async{
            
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        print("SideMenu Appeared!")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("SideMenu Disappearing!")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("SideMenu Disappeared!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryTableViewCell", for: indexPath) as! EntryTableViewCell
        let expenseCellModel = viewModel.cellViewModel(at: indexPath)
        
        cell.setupWithCellViewModel(cellViewModel: expenseCellModel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRow(at: indexPath)
    }
    
}
