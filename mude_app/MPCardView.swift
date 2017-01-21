//
//  MPCardView.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 25/11/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPCardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor {
        didSet {
            layer.borderColor = borderColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2);
        layer.shadowOpacity = 0.4
        layer.shadowPath = shadowPath.cgPath
    }
}
