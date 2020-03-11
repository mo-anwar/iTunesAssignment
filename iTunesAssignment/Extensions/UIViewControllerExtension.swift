//
//  UIViewControllerExtension.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(_ viewController: UIViewController, requiresFullScreen: Bool = true, completion: (() -> ())? = nil) {
        if #available(iOS 13.0, *) {
            viewController.modalPresentationStyle = requiresFullScreen ? .fullScreen : .automatic
        }
        present(viewController, animated: true, completion: completion)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func displayWarningAlert(leaveCompletion: (() -> Void)? = nil) {
        let title = "ConstantTexts.warningAlertTitle.rawValue"
        let message = "ConstantTexts.warningAlertMessage.rawValue"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "ConstantTexts.warningAlertStayMessage.rawValue", style: .cancel, handler: nil))

        alertController.addAction(UIAlertAction(title: "ConstantTexts.warningAlertLeaveMessage.rawValue", style: .default, handler: { _ in
            leaveCompletion?()
        }))

        present(alertController, animated: true, completion: nil)
    }
}
