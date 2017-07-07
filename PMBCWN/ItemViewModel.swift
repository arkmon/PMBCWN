//
//  ItemViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 07/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import Foundation
import FeedKit

final class ItemViewModel {
    
    var item: RSSFeedItem
    
    init(with item: RSSFeedItem) {
        self.item = item
    }
    
    var itemDescription: NSAttributedString {
        return item.description!.data.attributedString!
    }
    
    var itemTitle: String {
        return item.title!
    }
}

extension Data {
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print(error)
        }
        return nil
    }
}
extension String {
    var data: Data {
        return Data(utf8)
    }
}
