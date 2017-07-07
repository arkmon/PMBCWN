//
//  ItemCoordinator.swift
//  ToDo
//
//  Created on 28/12/2016.
//  Copyright © 2016 Experian Ltd. All rights reserved.
//

import Foundation
import FeedKit

final class ItemCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: ItemViewController?

    var item: RSSFeedItem?

    init(with delegate: CoordinatorDelegate?) {
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
