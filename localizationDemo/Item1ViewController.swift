//
//  Item1ViewController.swift
//  localizationDemo
//
//  Created by Prashant Prajapati on 14/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class Item1ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionArabic(_ sender: Any) {
        PPLocalization.sharedInstance.setLanguage(language: "ar")
//        let semantic: UISemanticContentAttribute = .forceRightToLeft
//        // sender.isOn ? .forceRightToLeft : .forceLeftToRight
//        UITabBar.appearance().semanticContentAttribute = semantic
//        UIView.appearance().semanticContentAttribute = semantic
//        UINavigationBar.appearance().semanticContentAttribute = semantic
        appDelegate.initrootView()
    }

    @IBAction func actionenglish(_ sender: Any) {
         PPLocalization.sharedInstance.setLanguage(language: "en")
//        let semantic: UISemanticContentAttribute = .forceLeftToRight
//        // sender.isOn ? .forceRightToLeft : .forceLeftToRight
//        PPLocalization.sharedInstance.setLanguage(language: "en")
//        
//        UIView.appearance().semanticContentAttribute = semantic
//        UITabBar.appearance().semanticContentAttribute = semantic
//        UINavigationBar.appearance().semanticContentAttribute = semantic
        appDelegate.initrootView()
    }
}
