//
//  SideMenuTableViewModel.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 12/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit
import Contentful
import Interstellar

class SideMenuTableViewModel {
    
    enum API {
        static let SPACE_ID = "pzytr6e954mh"
        static let ACCESS_TOKEN = "d463a73b03fe68af6f23455b7a1dc3c9b695038808127212152c696f0dd5d61e"
    }
    
    let client: Client = Client(spaceIdentifier: API.SPACE_ID, accessToken: API.ACCESS_TOKEN)
    var entriesArray: [Entry] = []
    var viewModels: [EntryTableCellViewModel] = []
    weak var coordinatorDelegate: SideMenuCoordinatorDelegate?
    
    func startFeed() { 
        client.fetchEntries(matching: ["limit": 100]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
            switch result {
            case .success(let entries):
                
                entries.items.forEach { entry in
                    print(entry.fields)
                    
                }
                self?.entriesArray = entries.items
                self?.makeTheList()
                
            case .error(let error):
                self?.handle(error: error)
            }
            
        }
    }
    
    func makeTheList() {
        viewModels .removeAll()
        for entry: Entry? in self.entriesArray {
            
            if (entry != nil) {
            viewModels.append(EntryTableCellViewModel(entry: (entry?.fields)!))
            }
        }
    }
    
    func numberOfItems() -> Int {
        
        return self.entriesArray.count
    }
    
    func item(at indexPath:IndexPath) -> [String : Any] {
        return self.entriesArray[indexPath.row].fields
    }
    
    func cellViewModel(at indexPath: IndexPath) -> EntryTableCellViewModel {
        
        return (viewModels[indexPath.row] as EntryTableCellViewModel)
    }
    
    func handle(error: Error) {
        print("Uh oh, something went wrong. You can do what you want with this \(error)")
    }
    
}

extension SideMenuTableViewModel {
    
    func selectedRow(at indexPath: IndexPath) {
        
        let item = self.item(at: indexPath)
        coordinatorDelegate?.didSelect(item: item)
    }
}
