//
//  ConfirmationAlertXib.swift
//  CustomAlertPopup
//
//  Created by Lahiru Chathuranga on 5/29/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import UIKit

class ConfirmationAlertXib: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var alertTitle: String = ""
    var alertMessage: String = ""
    var cancelBtnAction: String?
    var okBtnAction: String?
    var alertImage: UIImage = UIImage()
    var alertOkButtonColor: UIColor = UIColor()
    var alertOkButtonTextColor: UIColor = UIColor()
    var alertCancelButtonColor: UIColor = UIColor()
    var alertCancelButtonTextColor: UIColor = UIColor()
    
    var pressedOk: () -> () = {}
    var pressedCancel: () -> () = {}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI() {
        self.view.backgroundColor = .clear
        
        imageView.layer.cornerRadius = 22.0
        imageView.clipsToBounds = true
        
        contentView.layer.cornerRadius = 10.0
        
        okButton.layer.cornerRadius = 4
        okButton.clipsToBounds = true
        
        cancelButton.layer.cornerRadius = 4
        cancelButton.clipsToBounds = true
        
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        imageView.image = alertImage
        okButton.backgroundColor = alertOkButtonColor
        okButton.setTitleColor(alertOkButtonTextColor, for: .normal)
        cancelButton.backgroundColor = alertCancelButtonColor
        cancelButton.setTitleColor(alertCancelButtonTextColor, for: .normal)
    }
    func setValuesForLabel(title: String, message: String, image: UIImage, cancelButtonBackground: UIColor, cancelButtonTextColor: UIColor,  okButtonBackground: UIColor, okButtonTextColor: UIColor, cancelAction: String, okAction: String) {
        alertTitle = title
        alertMessage = message
        cancelBtnAction = cancelAction
        okBtnAction = okAction
        alertImage = image
        alertCancelButtonColor = cancelButtonBackground
        alertCancelButtonTextColor = cancelButtonTextColor
        alertOkButtonColor = okButtonBackground
        alertOkButtonTextColor = okButtonTextColor
    }
    @IBAction func pressedCancel(_ sender: Any) {
        pressedCancel()
    }
    @IBAction func pressedOk(_ sender: Any) {
        pressedOk()
    }
    
    
}
