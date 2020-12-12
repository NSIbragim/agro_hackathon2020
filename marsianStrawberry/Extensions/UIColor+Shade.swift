//
//  UIColor+Shade.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

extension UIColor {
    open var hue: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var saturation: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: &value, brightness: nil, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var brightness: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: nil, brightness: &value, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var alpha: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: nil, brightness: nil, alpha: &value)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var highlighted: UIColor {
        guard let hue = hue,
            let saturation = saturation,
            var brightness = brightness,
            let alpha = alpha else { return self }
        
        let factor = CGFloat(0.098)
        
        brightness -= brightness > 0.5 ? factor : -factor
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    open var textHighlighted: UIColor {
//        guard let hue = hue,
//            let saturation = saturation,
//            var brightness = brightness,
//            let alpha = alpha else { return self }
//
//        let factor = CGFloat(1)
//
//        brightness += factor
//
//        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        guard let alpha = alpha else { return self }
        
        return self.withAlphaComponent(alpha - 0.8)
    }
}
