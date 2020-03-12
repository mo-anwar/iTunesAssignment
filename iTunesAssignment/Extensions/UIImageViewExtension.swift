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
        if url?.absoluteString.hasPrefix("file://") == true {
            guard let url = url else { return }
            let provider = LocalFileImageDataProvider(fileURL: url)
            kf.setImage(with: provider, placeholder: placeholder)
        } else {
            var kf = self.kf
            kf.indicatorType = .activity
            kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
    func onTap(_ closure: @escaping () -> Void) {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.handler(closure)
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGestureRecognizer)
     }
    
}
