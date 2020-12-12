//
//  GHTableViewCell.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import UIKit

class GHTableViewCell: UITableViewCell {
    var numberOfGH = Int()
    var titleLabel = UILabel()
    var settingsButton = UIButton()
    var chartsView = UIView()
    var params = GreenHouse(temperature: 0, lightning: 0, acidity: 0)

    func setParams(params: GreenHouse, numberOfGH: Int?) {
        self.params = params
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.titleLabel.text = "Теплица " + String(numberOfGH)
        self.titleLabel.textColor = UIColor.black
//        self.titleLabel.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 120, height: 10)
        self.contentView.backgroundColor = UIColor.black
        self.contentView.addSubview(titleLabel)
        self.backgroundColor = UIColor.black
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
