//
//  cardViewDesign.swift
//  MyCarApp
//
//  Created by Sayed Abdo on 4/27/18.
//  Copyright © 2018 Yasmin Ahmed. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class cardViewDesign : UIView{
    
    @IBInspectable var cornerRaduis : CGFloat = 0
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    
    @IBInspectable let shadowOffsetSetWidth : Int = 0
    @IBInspectable let shadowOffsetSetHeight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRaduis
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width : shadowOffsetSetWidth , height: shadowOffsetSetHeight)
        let shadowPath = UIBezierPath(roundedRect : bounds , cornerRadius : cornerRaduis)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
    
    
}
