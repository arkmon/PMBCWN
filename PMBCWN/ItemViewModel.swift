//
//  ItemViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class ItemViewModel {
    
    
    var item: [String : Any]
    
    init(with item: [String : Any]) {
        self.item = item
    }
    
    var itemDescription: String {
        return "aha"
    }
    
    var itemTitle: String {
        return "cahnge me"
    }
}

