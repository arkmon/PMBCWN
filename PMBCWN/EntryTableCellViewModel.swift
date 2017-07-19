//
//  EntryTableCellViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import Contentful

class EntryTableCellViewModel {

    var entryItem = [String : Any]()
    
    init(entry: [String : Any]){
        entryItem = entry
    }
}
