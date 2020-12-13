//
//  NotificationTableViewCell.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 13.12.2020.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.numberOfLines = 0
    }
    
    func update(image: UIImage?, text: NSAttributedString?) {
        iconView.image = image
        textView.attributedText = text
    }
    
}
