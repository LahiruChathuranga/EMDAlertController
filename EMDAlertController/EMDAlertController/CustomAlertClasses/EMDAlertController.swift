//
//  ViewController.swift
//  CustomAlertPopup
//
//  Created by Lahiru Chathuranga on 5/29/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import UIKit
import PopupDialog

public class EMDAlertController: UIViewController {
    
    public static let shared = EMDAlertController()
    
    var alertImage: UIImage?
    var alertButtonColor: UIColor?
    var alertButtonTextColor: UIColor?
    var alertCancelButtonColor: UIColor?
    var alertCancelButtonTextColor: UIColor?
    
    let rootVC = UIApplication.shared.keyWindow?.rootViewController
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.backgroundColor = .clear
        
    }
    
    func showAlert(title: String?, message: String?, alertType: AlertType, image: AlertImage, buttonBackground: ButtonBackgroundColor, buttonTextColor: ButtonTextColor, okAction: String = "Dismiss", handler: (() -> Void)?) {
        
        switch image {
        case .customImage(image: let _image):
            alertImage = _image
        default:
            break
        }
        switch buttonBackground {
        case .customColor(color: let _color):
            alertButtonColor = _color
        default:
            break
        }
        switch buttonTextColor {
        case .customColor(color: let _color):
            alertButtonTextColor = _color
        default:
            break
        }
        switch alertType {
        case .success:
            showSuccessAlert(title: title, message: message ?? "", buttonBackground: alertButtonColor ?? Constant.Colors.sucessButton, image: alertImage ??  UIImage(named: "ic_success")!, buttonTextColor: alertButtonTextColor ?? .white, okAction: okAction , handler: {
                if let _handler = handler {
                    _handler()
                }
                
            })
        case .error:
            showErrorAlert(title: title, message: message ?? "", buttonBackground: alertButtonColor ?? Constant.Colors.errorButton, image: alertImage ??  UIImage(named: "ic_error")!, buttonTextColor: alertButtonTextColor ?? .white, okAction: okAction , handler: {
                if let _handler = handler {
                    _handler()
                }
            })
        case .warning:
            showWarningAlert(title: title, message: message ?? "", buttonBackground: alertButtonColor ?? Constant.Colors.warningButton, image: alertImage ??  UIImage(named: "ic_warning")!, buttonTextColor: alertButtonTextColor ?? .white, okAction: okAction , handler: {
                if let _handler = handler {
                    _handler()
                }
            })
        case .info:
            showInfoAlert(title: title, message: message ?? "", buttonBackground: alertButtonColor ?? Constant.Colors.infoButton, image: alertImage ??  UIImage(named: "ic_info")!, buttonTextColor: alertButtonTextColor ?? .white, okAction: okAction , handler: {
                if let _handler = handler {
                    _handler()
                }
            })
        }
    }
    
    func showConfirmationAlert(title: String?, message: String?, image: AlertImage, cancelButtonBackground: ButtonBackgroundColor, cancelButtonTextColor: ButtonTextColor,  okButtonBackground: ButtonBackgroundColor, okButtonTextColor: ButtonTextColor, cancelAction: String = "Cancel", okAction: String = "Ok", handler: @escaping (() -> Void)) {
        switch image {
        case .customImage(image: let _image):
            alertImage = _image
        default:
            break
        }
        switch okButtonBackground {
        case .customColor(color: let _color):
            alertButtonColor = _color
        default:
            break
        }
        switch okButtonTextColor {
        case .customColor(color: let _color):
            alertButtonTextColor = _color
        default:
            break
        }
        switch okButtonBackground {
        case .customColor(color: let _color):
            alertCancelButtonColor = _color
        default:
            break
        }
        switch cancelButtonTextColor {
        case .customColor(color: let _color):
            alertCancelButtonTextColor = _color
        default:
            break
        }
        
        showConfirmationAlert(title: title, message: message, image: alertImage ?? UIImage(named: "ic_confirm")!, cancelButtonBackground: alertCancelButtonColor ?? Constant.Colors.confirmationCancelButton, cancelButtonTextColor: alertCancelButtonTextColor ?? .white, okButtonBackground: alertButtonColor ?? Constant.Colors.confirmationOkButton, okButtonTextColor: alertButtonTextColor ?? .white, cancelAction: cancelAction ?? "Cancel", okAction: okAction ?? "Ok", handler: {
            handler()
            
        })
        
    }
    
    private func showSuccessAlert(title: String?, message: String, buttonBackground: UIColor = Constant.Colors.sucessButton, image: UIImage = UIImage(named: "ic_success")!, buttonTextColor: UIColor = .white, okAction: String = "Done", handler: @escaping (() -> Void)) {
        let successAlert = SuccessAlertXib(nibName: "SuccessAlertXib", bundle: nil)
        successAlert.setValuesForLabel(title: title ?? "Success", message: message, image: image, buttonBackground: buttonBackground, buttonTextColor: buttonTextColor, okAction: okAction)
        let popup = PopupDialog(viewController: successAlert, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: rootVC!.view.frame.width, tapGestureDismissal: false, panGestureDismissal: false, hideStatusBar: false, completion: nil)
        
        successAlert.pressedDone = {
            handler()
            popup.dismiss()
        }
        rootVC!.present(popup, animated: true, completion: nil)
    }
    
    private func showWarningAlert(title: String?, message: String, buttonBackground: UIColor = Constant.Colors.warningButton, image: UIImage = UIImage(named: "ic_warning")!, buttonTextColor: UIColor = .white, okAction: String = "Dissmiss", handler: @escaping (() -> Void)) {
        let warningAlert = WarningAlertXib(nibName: "WarningAlertXib", bundle: nil)
        warningAlert.setValuesForLabel(title: title ?? "Warning", message: message, image: image, buttonBackground: buttonBackground, buttonTextColor: buttonTextColor, okAction: okAction)
        let popup = PopupDialog(viewController: warningAlert, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: view.frame.width, tapGestureDismissal: false, panGestureDismissal: false, hideStatusBar: false, completion: nil)
        
        warningAlert.pressedOk = {
            handler()
            popup.dismiss()
        }
        rootVC!.present(popup, animated: true, completion: nil)
    }
    
    private func showErrorAlert(title: String?, message: String, buttonBackground: UIColor = Constant.Colors.errorButton, image: UIImage = UIImage(named: "ic_error")!, buttonTextColor: UIColor = .white, okAction: String = "Ok", handler: @escaping (() -> Void)) {
        let errorAlert = ErrorAlertXib(nibName: "ErrorAlertXib", bundle: nil)
        errorAlert.setValuesForLabel(title: title ?? "Error", message: message, image: image, buttonBackground: buttonBackground, buttonTextColor: buttonTextColor, okAction: okAction)
        let popup = PopupDialog(viewController: errorAlert, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: view.frame.width, tapGestureDismissal: false, panGestureDismissal: false, hideStatusBar: false, completion: nil)
        
        errorAlert.pressedOK = {
            handler()
            popup.dismiss()
        }
        rootVC!.present(popup, animated: true, completion: nil)
    }
    
    private func showInfoAlert(title: String?, message: String, buttonBackground: UIColor = Constant.Colors.infoButton, image: UIImage = UIImage(named: "ic_info")!, buttonTextColor: UIColor = .white, okAction: String = "Ok", handler: @escaping (() -> Void) ) {
        let infoAlert = InfoAlertXib(nibName: "InfoAlertXib", bundle: nil)
        infoAlert.setValuesForLabel(title: title ?? "Info", message: message, image: image, buttonBackground: buttonBackground, buttonTextColor: buttonTextColor, okAction: okAction)
        let popup = PopupDialog(viewController: infoAlert, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: view.frame.width, tapGestureDismissal: false, panGestureDismissal: false, hideStatusBar: false, completion: nil)
        
        infoAlert.pressedOk = {
            handler()
            popup.dismiss()
        }
        rootVC!.present(popup, animated: true, completion: nil)
    }
    
    private func showConfirmationAlert(title: String?, message: String?, image: UIImage = UIImage(named: "ic_confirm")!, cancelButtonBackground: UIColor = Constant.Colors.confirmationCancelButton, cancelButtonTextColor: UIColor = .white,  okButtonBackground: UIColor = Constant.Colors.confirmationOkButton, okButtonTextColor: UIColor = .white, cancelAction: String = "Cancel", okAction: String = "Ok", handler: @escaping (() -> Void)) {
        let confirmationAlert = ConfirmationAlertXib(nibName: "ConfirmationAlertXib", bundle: nil)
        confirmationAlert.setValuesForLabel(title: title ?? "Confirmation" , message: message ?? "", image: image, cancelButtonBackground: cancelButtonBackground, cancelButtonTextColor: cancelButtonTextColor,  okButtonBackground: okButtonBackground, okButtonTextColor: okButtonTextColor, cancelAction: cancelAction, okAction: okAction)
        let popup = PopupDialog(viewController: confirmationAlert, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: view.frame.width, tapGestureDismissal: false, panGestureDismissal: false, hideStatusBar: false, completion: nil)
        
        
        confirmationAlert.pressedCancel = {
            popup.dismiss()
        }
        
        confirmationAlert.pressedOk = {
            handler()
            popup.dismiss()
        }
        rootVC!.present(popup, animated: true, completion: nil)
    }
}
enum AlertType {
    case success
    case error
    case info
    case warning
}
enum AlertImage {
    case original
    case customImage(image: UIImage)
}
enum ButtonTextColor {
    case original
    case customColor(color: UIColor)
}
enum ButtonBackgroundColor {
    case original
    case customColor(color: UIColor)
}
