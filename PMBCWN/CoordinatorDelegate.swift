//
//  CoordinatorDelegate.swift
//  money
//
//  Created by Arkadiusz Dowejko on 23/03/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit

public protocol CoordinatorDelegate: class {
    
    func present(_: UIViewController)
    func dismiss(_: UIViewController)
    
}

public extension CoordinatorDelegate {
    
    func present(_ viewController: UIViewController) { }
    func dismiss(_ viewController: UIViewController) { }
    
}
