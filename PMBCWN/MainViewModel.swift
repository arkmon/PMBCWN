//
//  MainViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 07/08/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class MainViewModel {
weak var coordinatorDelegate: MainCoordinatorDelegate?
}

extension MainViewModel {
    
    func showMenu() {
        coordinatorDelegate?.showMenu()
    }
}
