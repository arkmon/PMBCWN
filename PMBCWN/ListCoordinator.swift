//
//  ListCoordinator.swift
//  money
//
//  Created by Arkadiusz Dowejko on 04/04/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit
import FeedKit

class ListCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var root: FeedsViewController?
    var itemCoordinator: TemporaryItemCoordinator?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
        
        if let listViewController = viewController(named: "FeedsViewController", ofType: FeedsViewController.self, in: storyboard(named: "Main")) {
            
            listViewController.viewModel.coordinatorDelegate = self
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

extension ListCoordinator: ListCoordinatorDelegate {
    
    func didSelect(item: RSSFeedItem) {
        itemCoordinator = TemporaryItemCoordinator(with: self)
        itemCoordinator?.item = item
        itemCoordinator?.start()
    }
}
