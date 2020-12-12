//
//  CustomSlider.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class CustomSlider: UISlider {

    @IBInspectable var trackHeight: CGFloat = 6

    @IBInspectable var thumbRadius: CGFloat = 20

    // Custom thumb view which will be converted to UIImage
    // and set as thumb. You can customize it's colors, border, etc.
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        
        thumb.backgroundColor = UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)
        thumb.layer.borderWidth = 0.4
        thumb.layer.borderColor = UIColor(red: 0.162, green: 0.162, blue: 0.162, alpha: 1).cgColor
        
        return thumb
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        tintColor = UIColor(red: 0.162, green: 0.162, blue: 0.162, alpha: 1)
        
        let thumb = thumbImage(radius: thumbRadius)
        
        setThumbImage(thumb, for: .normal)
    }

    private func thumbImage(radius: CGFloat) -> UIImage {
        thumbView.frame = CGRect(x: 0, y: radius / 2, width: radius, height: radius)
        thumbView.layer.cornerRadius = radius / 2

        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newRect = super.trackRect(forBounds: bounds)
        
        newRect.size.height = trackHeight
        
        return newRect
    }

}
