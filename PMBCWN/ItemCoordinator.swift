//
//  ItemCoordinator.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class ItemCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: ItemViewController?
    
    var item: [String : Any]?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
        guard let item = item else {
            return
        }
        
        if let itemViewController = viewController(named: "ItemViewController", ofType: ItemViewController.self, in: storyboard(named: "Main")) {
            
            root = itemViewController
            let viewModel = ItemViewModel(with: item)
            itemViewController.viewModel = viewModel
            delegate?.present(itemViewController)
            
            
        }
    }
    
}
