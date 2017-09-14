//
//  PPButton.swift
//  localizationDemo
//
//  Created by Prashant Prajapati on 14/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class PPButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitle(PPLocalizedString(key: self.titleLabel?.text as Any, comment: "") as? String, for: .normal)
        self.initialization()
    }
    
    func initialization() {
        let dir = PPLocalization().getlanguageDirection()
        print(dir)
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
