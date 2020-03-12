//
//  UIImageViewExtension.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    func load(url: URL?, placeholder: UIImage? = nil) {
            var kf = self.kf
            kf.indicatorType = .activity
            kf.setImage(with: url, placeholder: placeholder)
    }
}
