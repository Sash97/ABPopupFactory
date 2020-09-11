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

   let popup = ABPopupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.popup)
     
    }


}

