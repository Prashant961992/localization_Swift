//
//  PPButton.swift
//  localizationDemo
//
//  Created by Prashant Prajapati on 14/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class PPButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitle(PPLocalizedString(key: self.titleLabel?.text as Any, comment: "") as? String, for: .normal)
        self.initialization()
    }
    
    func initialization() {
        let dir = PPLocalization().getlanguageDirection()
        if  dir == .leftToRight {
            semanticContentAttribute = .forceLeftToRight
            imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2 * 2))
        }
        else {
            semanticContentAttribute = .forceRightToLeft
            imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2 * 2))
        }
    }
}
