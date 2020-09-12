//
//  ViewController.swift
//  TestABPopupFactory
//
//  Created by Aleksandr Bagdasaryan on 9/11/20.
//  Copyright © 2020 Aleksandr Bagdasaryan. All rights reserved.
//

import UIKit
import ABPopupFactory

class ViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ABPopupFactory.shared.showPopup(in: self.view, message: .message(message: "dsd"), buttonTitles: "OK")
     
    }


}

