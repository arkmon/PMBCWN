//
//  SideMenuCoordinator.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuCoordinator: Coordinator {
    public var root: UIViewController?

    //typealias ControllerType = UIViewController
    weak var delegate: CoordinatorDelegate?
    var itemCoordinator: ItemCoordinator?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start () {
        
        let menuLeftNavigationController = viewController(named: "SideMenuTableView", ofType: SideMenuTableView.self, in: storyboard(named: "Main"))
        menuLeftNavigationController?.viewModel.coordinatorDelegate = self
    }
    
}

extension SideMenuCoordinator: CoordinatorDelegate {
    
    func present(_ viewController: UIViewController) {
        delegate?.present(viewController)
    }
}

extension SideMenuCoordinator: SideMenuCoordinatorDelegate {
    
    func didSelect(item: [String : Any]) {
        
        itemCoordinator = ItemCoordinator(with: self)
        itemCoordinator?.item = item
        itemCoordinator?.start()
    }
}
