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
    weak var coordinatorDelegate: ListCoordinatorDelegate?
    var viewModels: [FeedTableCellViewModel] = []
    
    func startFeed() {
        
        FeedParser(URL: feedURL)?.parseAsync { (result) in
            guard let feed = result.rssFeed, result.isSuccess else {
                print(result.error)
                return
            }
            if (result.isSuccess) {
                self.mainFeed = feed
                self.feeds = (self.mainFeed?.items)!
            } else {
                
            }
        }
    }
    
    func makeTheList() {
        viewModels .removeAll()
        for feed: RSSFeedItem? in self.feeds {
            viewModels.append(FeedTableCellViewModel(feed: feed!))
        }
    }
    
    func feedName() -> String {
        
        return self.mainFeed?.title ?? "Parafia w Nottingham"
    }
    
    func numberOfItems() -> Int {
        
        return self.viewModels.count
    }
    
    func item(at indexPath:IndexPath) -> RSSFeedItem {
        return (self.mainFeed?.items?[indexPath.row])!
    }
    
    func cellViewModel(at indexPath: IndexPath) -> FeedTableCellViewModel {
        return (viewModels[indexPath.row] as FeedTableCellViewModel)
    }
}

extension FeedTableViewModel {
    
    func selectedRow(at indexPath: IndexPath) {
        let item = self.item(at: indexPath)
        coordinatorDelegate?.didSelect(item: item)
    }
}
