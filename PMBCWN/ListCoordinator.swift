//
//  ListCoordinator.swift
//  money
//
//  Created by Arkadiusz Dowejko on 04/04/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var root: FeedsViewController?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
        
        if let listViewController = viewController(named: "FeedsViewController", ofType: FeedsViewController.self, in: storyboard(named: "Main")) {
            
            //listViewController.viewModel.coordinatorDelegate = self
            root = listViewController
            
            delegate?.present(listViewController)
        }
    }
}

extension ListCoordinator: CoordinatorDelegate {
    
    func present(_ viewController: UIViewController) {
        delegate?.present(viewController)
    }
    
}
