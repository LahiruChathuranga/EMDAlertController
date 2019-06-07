//
//  ImageHelper.swift
//  EMDAlertController
//
//  Created by Lahiru Chathuranga on 6/7/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import Foundation
class ImageHelper {
    class func loadImage(name: String?) -> UIImage? {
        if let n = name {
            let podBundle = Bundle(for: ImageHelper.self)
            if let url = podBundle.url(forResource: "CDAlertView", withExtension: "bundle") {
                let bundle = Bundle(url: url)
                return UIImage(named: n, in: bundle, compatibleWith: nil)
            }
        }
        return nil
    }
    
}
