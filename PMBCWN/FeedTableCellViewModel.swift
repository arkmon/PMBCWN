//
//  FeedTableCellViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 06/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import FeedKit

class FeedTableCellViewModel {

    var feedItem = RSSFeedItem()
    
    init(feed: RSSFeedItem) {
        feedItem = feed
    }
    
}
