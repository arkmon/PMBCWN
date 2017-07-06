//
//  FeedTableCellViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 06/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import FeedKit

class FeedTableCellViewModel: NSObject {

    var feedItem = RSSFeedItem()
    
    func presetCellWithItem(feed: RSSFeedItem) {
        feedItem = feed
    }
}
