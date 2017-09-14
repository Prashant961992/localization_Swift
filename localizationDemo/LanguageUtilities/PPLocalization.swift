//
//  PPLocalization.swift
//  localizationDemo
//
//  Created by Prashant Prajapati on 14/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

enum LanguageDirection : Int {
    case leftToRight = 1
    case rightToLeft = 2
}

class PPLocalization: NSObject {
    static let sharedInstance = PPLocalization()
    private var bundle: Bundle? = nil
    var languageDirection = LanguageDirection(rawValue: 1)
    
    func getlanguageDirection() -> LanguageDirection {
        if languageDirection?.rawValue == 0 {
            return .leftToRight
        }
        return languageDirection!
    }
    
    func localizedString(forKey key: String, value comment: String) -> String {
        return bundle!.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func setLanguage(language: String) -> Void {
        var l = language as String;
        
        if l.characters.count == 0 {
            l = "en"
        }
        UserDefaults.standard.set(l, forKey: "kLanguage")
        UserDefaults.standard.synchronize()
        if (language == "ar-BH") {
            languageDirection = .rightToLeft
        }
        else {
            languageDirection = .leftToRight
        }
        let path: String? = Bundle.main.path(forResource: l, ofType: "lproj")
        if path == nil {
            //in case the language does not exists
            resetLocalization()
        }
        else {
            bundle = Bundle(path: path!)
        }
    }
    
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    func getLanguage() -> String {
        var lang: String? = UserDefaults.standard.string(forKey: "kLanguage")
        if (lang?.characters.count ?? 0) == 0 {
            lang = "en"
        }
        return lang!
    }
    
    func languageSelectedString(forKey key: String) -> String {
        var path: String
        if (getLanguage() == "en") {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")!
        }
        else if (getLanguage() == "hi") {
            path = Bundle.main.path(forResource: "hi", ofType: "lproj")!
        }
        else if (getLanguage() == "ko") {
            path = Bundle.main.path(forResource: "ko", ofType: "lproj")!
        }
        else if (getLanguage() == "zh-Hans") {
            path = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")!
        }
        else if (getLanguage() == "ar-BH") {
            path = Bundle.main.path(forResource: "ar-BH", ofType: "lproj")!
        }else if (getLanguage() == "ar") {
            path = Bundle.main.path(forResource: "ar", ofType: "lproj")!
        }
        else {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")!
        }
        
        let languageBundle = Bundle(path: path)
        let str = languageBundle?.localizedString(forKey: key, value: "", table: nil)
        
        return str!
    }
}

func PPLocalizedString(key: Any, comment: Any) -> Any {
    return PPLocalization.sharedInstance.localizedString(forKey: (key as! String), value: (comment as! String))
}


