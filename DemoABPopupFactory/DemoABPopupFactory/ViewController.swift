//
//  ViewController.swift
//  DemoABPopupFactory
//
//  Created by Aleksandr Bagdasaryan on 9/12/20.
//  Copyright © 2020 Aleksandr Bagdasaryan. All rights reserved.
//

import UIKit
import ABPopupFactory



class ViewController: UIViewController {

    //MARK - Outlets -
    
    
    
    //MARK: - Properties -
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
   
    
    
   
    
    //MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - Actions -
    
    @IBAction func buttonsTapped(_ sender: UIButton) {
        let tappedButton = ButtonCases(rawValue: (sender.titleLabel?.text)!)!
        
        switch tappedButton {
        case .first:
            ABPopupFactory.shared.showPopup(in: self.view, message: .message(message: "One Button!"), buttonTitles: "Close")
        case .second:
            ABPopupFactory.shared.showPopup(in: self.view, message: .message(message: "Two Buttons!"), buttonTitles: "Cool, Close") { index in
                switch index {
                case 0: print("Cool button tapped")
                case 1: print("Close button tapped")
                default: assertionFailure("Something goes wrong")
                }
            }
        case .third:
            ABPopupFactory.shared.showPopup(in: self.view, message: .message(message: "More Buttons!"), buttonTitles: "Cool, Nice, Close") { index in
                switch index {
                case 0: print("Cool button tapped")
                case 1: print("Nice button tapped")
                case 2: print("Close button tapped")
                default: assertionFailure("Something goes wrong")
                }
            }
        }
    }
    
}

fileprivate enum ButtonCases: String {
    case first  = "One Button"
    case second = "Two Button"
    case third  = "More Button"
}


