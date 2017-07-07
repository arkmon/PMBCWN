//
//  ListCoordinatorDelegate.swift
//  ToDo
//
//  Created on 05/01/2017.
//  Copyright © 2017 Experian Ltd. All rights reserved.
//

import Foundation
import FeedKit

protocol ListCoordinatorDelegate: class {

    func didSelect(item: RSSFeedItem)

}
