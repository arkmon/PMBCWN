//
//  MainViewController.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 07/08/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func test(_ sender: Any) {
        viewModel.showMenu()
    }
    
    func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }

}
