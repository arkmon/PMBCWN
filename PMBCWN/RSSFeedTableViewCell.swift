//
//  RSSFeedTableViewCell.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 06/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class RSSFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedTitleLabel: UILabel!
    
    func setupWithCellViewModel(cellViewModel: FeedTableCellViewModel)  {
        
        self.feedTitleLabel.text = cellViewModel.feedItem.title
        
    }
    
}
