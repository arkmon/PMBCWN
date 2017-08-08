//
//  MainCoordinator.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 07/08/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import SideMenu

class MainCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: MainViewController?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
        if let mainViewController = viewController(named: "MainViewController", ofType: MainViewController.self, in: storyboard(named: "Main")) {
            
            mainViewController.viewModel.coordinatorDelegate = self
            root = mainViewController
            
            delegate?.present(root!)
            
        }
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func showMenu() {
        let menuLeftNavigationController = root? .storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        menuLeftNavigationController?.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.menuPresentMode = .viewSlideInOut
        
        SideMenuManager.menuAddPanGestureToPresent(toView: (root?.navigationController!.navigationBar)!)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: (root?.navigationController!.view)!)
        
        root? .present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
}
