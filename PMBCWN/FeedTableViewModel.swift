//
//  FeedModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 06/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import FeedKit

let feedURL = URL(string: "http://parafianottingham.org.uk/feed/rss/blog/blog.feed")!

class FeedTableViewModel {
    
    var feeds: [RSSFeedItem?] = []
    
    var mainFeed: RSSFeed?
    
    var viewModels: [FeedTableCellViewModel] = []
    func startFeed() {
        
        FeedParser(URL: feedURL)?.parseAsync { (result) in
            self.mainFeed = result.rssFeed

            self.feeds = (self.mainFeed?.items)!
        }
    }
    
    func makeTheList() {
        viewModels .removeAll()
        for feed: RSSFeedItem? in self.feeds {
            viewModels.append(FeedTableCellViewModel(feedItem: feed!))
        }
    }
    
    func numberOfItems() -> Int {
        return (self.mainFeed?.items?.count)!
    }
    
    func item(at indexPath:IndexPath) -> RSSFeedItem {
        return (self.mainFeed?.items?[indexPath.row])!
    }
}
