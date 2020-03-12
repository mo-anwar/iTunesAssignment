//
//  UIViewControllerExtension.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(_ viewController: UIViewController, requiresFullScreen: Bool = true, completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            viewController.modalPresentationStyle = requiresFullScreen ? .fullScreen : .automatic
        }
        present(viewController, animated: true, completion: completion)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
