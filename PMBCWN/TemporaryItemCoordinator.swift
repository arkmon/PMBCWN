//
//  ItemCoordinator.swift
//  ToDo
//
//  Created on 28/12/2016.
//  Copyright © 2016 Experian Ltd. All rights reserved.
//

import Foundation
import FeedKit

final class TemporaryItemCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: TemporaryItemViewController?

    var item: RSSFeedItem?

    init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }

    func start() {
        
        guard let item = item else {
            return
        }

        if let itemViewController = viewController(named: "TemporaryItemViewController", ofType: TemporaryItemViewController.self, in: storyboard(named: "Main")) {
            
            root = itemViewController
            let viewModel = TemporaryItemViewModel(with: item)
            itemViewController.viewModel = viewModel
            delegate?.present(itemViewController)
        

        }
    }

}
