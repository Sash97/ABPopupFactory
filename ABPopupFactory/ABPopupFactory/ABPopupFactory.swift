//
//  ABPopupFactory.swift
//  Evenation
//
//  Created by Aleksandr Bagdasaryan on 3/27/20.
//  Copyright © 2020 Aleksandr Bagdasaryan. All rights reserved.
//

import UIKit



public class ABPopupFactory {
    //MARK: - Properties -
    
    public static let shared = ABPopupFactory()
    
    
    
    //MARK: - Init -
    
    private init() {}
    
    
    
    //MARK: - Methods -
    
    public func showPopup(in view: UIView?, message: Messages, image: UIImage = #imageLiteral(resourceName: "Снимок экрана 2020-09-12 в 12.01.17"), buttonTitles: String, completion: ((Int)->())? = nil) {
        guard let view = view else { return }
        let blackView   = self.createBlackView(under: view)
        let popup = self.createPopup(message: message, image: image, buttonTitles: buttonTitles)
        view.addSubview(blackView)
        view.addSubview(popup)
        let width = view.frame.width - 64
        popup.centerInSuperview(size: .init(width: width, height: 203))
        popup.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popup.alpha = 0
        self.animatePopup(blackView: blackView, popup: popup, animateParams: PopupAnimateParapms(alpha: 1, transform: .identity))
        self.handleButtonTapped(blackView, popup, completion)
    }

    private func handleButtonTapped(_ blackView: UIView, _ popup: ABPopupView, _ completion: ((Int)->())? = nil) {
        popup.handleButtonTappedClosure = { [weak self](index) in
            guard let self = self else { return }
            self.animatePopup(blackView: blackView, popup: popup, animateParams: PopupAnimateParapms(alpha: 0, transform: .init(scaleX: 1.3, y: 1.3))) {
                blackView.removeFromSuperview()
                popup.removeFromSuperview()
                completion?(index)
            }
        }
    }
    
    private func createPopup(message: Messages, image: UIImage, buttonTitles: String) -> ABPopupView {
        let popup = ABPopupView()
        popup.backgroundColor = #colorLiteral(red: 0.4373095036, green: 0.1976997852, blue: 0.5604567528, alpha: 1)
        popup.popupTextLabel.text = message.description
        popup.popupImageView.image = image
        popup.commaSeparatedButtonTitles = buttonTitles
        return popup
    }
    
    private func createBlackView(under view: UIView) -> UIView {
        let blackView = UIView()
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        blackView.alpha = 0
        blackView.frame = view.frame
        return blackView
    }
    
    private func animatePopup(blackView: UIView, popup: UIView, animateParams: PopupAnimateParapms, completion: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.5, animations: {
            blackView.alpha = animateParams.alpha
            popup.alpha = animateParams.alpha
            popup.transform = animateParams.transform
        } ) { (_) in
            completion?()
        }
    }
}

fileprivate typealias PopupAnimateParapms = (alpha: CGFloat, transform: CGAffineTransform)


extension UIImage {
   convenience init?(podAssetName: String) {
       let podBundle = Bundle(for: ABPopupView.self)
      
       /// A given class within your Pod framework
       guard let url = podBundle.url(forResource: "ABPopupFactory",
                                     withExtension: "bundle") else {
           return nil
                                       
       }

       self.init(named: podAssetName,
                 in: Bundle(url: url),
                 compatibleWith: nil)
   }
}
