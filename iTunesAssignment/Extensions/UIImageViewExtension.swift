//
//  UIImageViewExtension.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    func load(url: URL?, placeholder: UIImage? = nil) {
            var kf = self.kf
            kf.indicatorType = .activity
            kf.setImage(with: url, placeholder: placeholder)
    }
}
