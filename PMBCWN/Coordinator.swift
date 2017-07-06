//
//  Coordinator.swift
//  money
//
//  Created by Arkadiusz Dowejko on 23/03/2017.
//  Copyright © 2017 Arek Dowejko. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    associatedtype ControllerType: UIViewController
    
    weak var delegate: CoordinatorDelegate? { get set }
    var root: ControllerType? { get set }
    
    init(with: CoordinatorDelegate?)
    
    func start()
}

extension Coordinator {
    
    func storyboard(named name: String, in bundle: Bundle = Bundle.main) -> UIStoryboard {
        return UIStoryboard.init(name: name, bundle: bundle)
    }
    
    func viewController<T>(named name: String, ofType type: T.Type, in storyboard: UIStoryboard) -> T? {
        return storyboard.instantiateViewController(withIdentifier: name) as? T
    }
    
}
