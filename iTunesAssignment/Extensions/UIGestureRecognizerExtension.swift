//
//  UIGestureRecognizer.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    func handler(_ closure: @escaping () -> ()) {
        objc_removeAssociatedObjects(self)
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke))
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

@objc class ClosureSleeve: NSObject {
    let closure: () -> ()
    
    init (_ closure: @escaping () -> ()) {
        self.closure = closure
        super.init()
    }
    
    @objc func invoke() {
        closure()
    }
}
