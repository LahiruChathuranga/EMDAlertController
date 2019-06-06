//
//  SuccessAlertXib.swift
//  CustomAlertPopup
//
//  Created by Lahiru Chathuranga on 5/29/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import Foundation
import UIKit

class SuccessAlertXib: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var alertTitle: String = ""
    var alertMessage: String = ""
    var okBtnAction: String?
    var alertImage: UIImage = UIImage()
    var alertButtonColor: UIColor = UIColor()
    var alertButtonTextColor: UIColor = UIColor()
    var pressedDone: () ->() = {}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI() {
        
        self.view.backgroundColor = .clear
        imageView.layer.cornerRadius = 22.0
        imageView.clipsToBounds = true
        
        contentView.layer.cornerRadius = 10.0
        view.layer.cornerRadius = 10.0
        
        doneButton.layer.cornerRadius = 4
        doneButton.clipsToBounds = true
        
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        imageView.image = alertImage
        doneButton.backgroundColor = alertButtonColor
        doneButton.setTitleColor(alertButtonTextColor, for: .normal) 
        
        
    }
    
    func setValuesForLabel(title: String, message: String, image: UIImage, buttonBackground: UIColor, buttonTextColor: UIColor, okAction: String) {
        alertTitle = title
        alertMessage = message
        okBtnAction = okAction
        alertImage = image
        alertButtonColor = buttonBackground
        alertButtonTextColor = buttonTextColor
    }
    
    @IBAction func PressedDone(_ sender: Any) {
        pressedDone()
    }
}


