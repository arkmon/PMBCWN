//
//  EntryTableViewCell.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var feedTitleLabel: UILabel!
    
    func setupWithCellViewModel(cellViewModel: EntryTableCellViewModel)  {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.feedTitleLabel.text = cellViewModel.entryItem["title"] as? String
    }
    
}
