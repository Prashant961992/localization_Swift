//
//  PPLabel.swift
//  localizationDemo
//
//  Created by Prashant Prajapati on 14/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class PPLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //        if ([ApplicationData sharedInstance].language == 0) {
        //            self.textAlignment = NSTextAlignmentLeft;
        //        } else {
        //            self.textAlignment = NSTextAlignmentRight;
        //        }
        text = PPLocalizedString(key: text as Any, comment: "") as? String
        
    }
}
