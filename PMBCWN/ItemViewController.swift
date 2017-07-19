//
//  ItemViewController.swift
//  PMBCWN
//
//  Created by Arkadiusz Dowejko on 14/07/2017.
//  Copyright © 2017 arkmon. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var viewModel: ItemViewModel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewDescription.text = viewModel.itemDescription
        self.title = self.viewModel.itemTitle
    }
}
