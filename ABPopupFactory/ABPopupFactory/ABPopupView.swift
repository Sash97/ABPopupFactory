//
//  ABPopupView.swift
//  PoolMe
//
//  Created by Aleksandr Bagdasaryan on 3/26/20.
//  Copyright © 2020 Aleksandr Bagdasaryan. All rights reserved.
//

import UIKit


/*
 Blah
 */



public class ABPopupView: UIView {
    //MARK - Outlets -
    
    @IBOutlet public weak var popupImageView: UIImageView!
    @IBOutlet public weak var popupTextLabel: UILabel!

    
    
    
    
    //MARK: - Properties -
    
    public var handleButtonTappedClosure: ((Int) -> ())?
    
    private var buttons = [UIButton]()
    private var titles = [String]()
    
    public var commaSeparatedButtonTitles: String = "" {
        didSet {
            self.titles.removeAll()
            self.titles = self.commaSeparatedButtonTitles.components(separatedBy: ", ")
            self.updateView()
        }
    }
    
    public var boldSystem: CGFloat = 17 {
        didSet {
            self.updateView()
        }
    }

    public var titleColor: UIColor = .white {
        didSet {
            self.updateView()
        }
    }
   
    
    //MARK: - Init -
   
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.configureSubviewsDesign()
    }
    
    
    
    //MARK: - Methods -
    
    private func updateView() {
        self.cleanView()
        self.createButtons()
        self.configureButtonsStackView()
    }
    
    private func cleanView() {
        self.buttons.removeAll()
    }
    
    private func createButtons() {
        for (index, title) in self.titles.enumerated() {
            let button = UIButton(type: .system)
            let attributedString = title.attributedString(boldSystem: self.boldSystem, foregroundColor: self.titleColor)
            button.backgroundColor = index == 0 ?  .systemGreen : .clear
            button.setAttributedTitle(attributedString, for: .normal)
            button.tag = index
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.4
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
            buttons.append(button)
        }
    }
    
    private func configureButtonsStackView() {
        let buttonsStackView = UIStackView(arrangedSubviews: self.buttons)
        buttonsStackView.isLayoutMarginsRelativeArrangement = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 8
        buttonsStackView.distribution = .fillEqually
        
        if self.buttons.count == 2 {
            buttonsStackView.distribution = .fill
            self.buttons[0].widthAnchor.constraint(equalTo: self.buttons[1].widthAnchor, multiplier: 2.5).isActive = true
        }
        
        self.addSubview(buttonsStackView)
        buttonsStackView.anchor(leading: self.leadingAnchor,
                                bottom: self.bottomAnchor,
                                trailing: self.trailingAnchor,
                                padding: .init(top: 0, left: 16, bottom: 25, right: 16),
                                size: .init(width: 0, height: 45))
    }
    
    private func setupView() {
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        
    }
    
    private func loadViewFromXib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
        let bundle = Bundle(for: ABPopupFactory.self)
        let nib = UINib(nibName: "ABPopupView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
    
    private func configureSubviewsDesign() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.roundCorners(corners: [.topLeft, .bottomRight], radius: 35)
        self.popupImageView.layer.cornerRadius = 50
        self.popupImageView.layer.masksToBounds = true
        self.popupImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        self.popupImageView.layer.borderWidth = 2
    }
    
    
    @objc private func handleButtonTapped(sender: UIButton) {
        self.handleButtonTappedClosure?(sender.tag)
    }
}




fileprivate extension String {
    func attributedString(boldSystem: CGFloat, foregroundColor: UIColor) -> NSAttributedString {
        let attributedString = NSAttributedString(string: self, attributes: [.font : UIFont.boldSystemFont(ofSize: boldSystem), .foregroundColor : foregroundColor])
        
        return attributedString
    }
}
