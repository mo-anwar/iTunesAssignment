//
//  UIViewExtension.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol NibLoadable {
    
}
extension UIView {
    
    var fittingHeight: CGFloat {
        return systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
    
    static var nib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    func attachTapGesture(_ handler: @escaping () -> ()) {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer()
        tapGesture.handler(handler)
        addGestureRecognizer(tapGesture)
    }
    
    func showActivityIndicator(isUserInteractionEnabled: Bool) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: self, animated: true)
            hud.isUserInteractionEnabled = !isUserInteractionEnabled
            hud.restorationIdentifier = "activityIndicator"
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            for subview in self.subviews where subview.restorationIdentifier == "activityIndicator" {
                guard let hud = subview as? MBProgressHUD else { return }
                hud.hide(animated: true)
            }
        }
    }
    
    static func loadFromNib(with owner: Any? = nil) -> Self {
        
        let nib = UINib(nibName: "\(self)", bundle: nil)
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
        
    }
    
    func constraint(block: (UIView) -> ()) {
        translatesAutoresizingMaskIntoConstraints = false
        block(self)
    }
}
