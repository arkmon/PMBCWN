//
//  BaseAppCoordinator.swift
//  money
//
//  Created by Arkadiusz Dowejko on 23/03/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit

class BaseAppCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var root: UINavigationController?
    
    var landingCoordinator: ListCoordinator?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
        if let navigationController = viewController(named: "AppNavigationController", ofType: UINavigationController.self, in: storyboard(named: "Main")) {
            root = navigationController
            delegate?.present(navigationController)
            showLanding()
        }
    }
    
    func showLanding() {
        landingCoordinator = ListCoordinator(with: self)
        landingCoordinator?.start()
    }
    
}

// MARK: - CoordinatorDelegate

extension BaseAppCoordinator: CoordinatorDelegate {
    
    func present(_ viewController: UIViewController) {
        root?.pushViewController(viewController, animated: true)
    }
    
}
