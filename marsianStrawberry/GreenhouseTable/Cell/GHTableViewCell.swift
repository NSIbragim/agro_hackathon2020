//
//  GHTableViewCell.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import UIKit
import PNChart

class GHTableViewCell: UITableViewCell {
    var params = GreenHouse(temperature: 0, lightning: 0, acidity: 0, water: 0)

    func setParams(params: GreenHouse, numberOfGH: Int?) {
        self.params = params
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


    }

    func configureUI(numberOfGH: Int){

        self.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)

        // Сама ячейка
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 335, height: 175)
        view.backgroundColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.062, green: 0.062, blue: 0.062, alpha: 1).cgColor
        var parent = self.contentView
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 335).isActive = true
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 25).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 8).isActive = true


        // Теплица №1
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 106, height: 20)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.text = "Теплица №" + String(numberOfGH + 1)
        parent = self.contentView
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 106).isActive = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 24).isActive = true


        // Параметры теплицы 􀍟
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 22, height: 20)
        imageView.backgroundColor = .clear
        imageView.image?.withTintColor(UIColor.gray)
        let imageIcon = UIImage(systemName: "gear")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 317).isActive = true
        imageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 24).isActive = true

        
        // Левый график освещение

        var chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        var shadowColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        guard let lightningChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        lightningChart.lineWidth = 6
        lightningChart.backgroundColor = UIColor.clear
        parent.addSubview(lightningChart)
        lightningChart.translatesAutoresizingMaskIntoConstraints = false
        lightningChart.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 48).isActive = true
        lightningChart.topAnchor.constraint(equalTo: parent.topAnchor, constant: 68).isActive = true


        // число внтури графика освещения
        var needLightAlert = false
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 35, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .center
        if let lightValue = params.lightning {
            view.text = String(lightValue)
            if lightValue > 80 {
                lightningChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
            } else if lightValue > 60 {
                lightningChart.strokeColor = UIColor.systemYellow
            } else if lightValue > 30 {
                lightningChart.strokeColor = UIColor.orange
            } else {
                lightningChart.strokeColor = UIColor.red
                needLightAlert = true
            }
        } else {
            view.text = "0"
            lightningChart.strokeColor = UIColor.red
            needLightAlert = true
        }
        lightningChart.stroke()
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 35).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: lightningChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 90).isActive = true


        // Освещенние
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 13)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .center
        view.text = "Освещенние"
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 70).isActive = true
        view.heightAnchor.constraint(equalToConstant: 13).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 44).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true

        if (needLightAlert) {
            view = UILabel()
            view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            view.backgroundColor = .clear
            view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            view.font = UIFont.systemFont(ofSize: 13)
            view.lineBreakMode = .byWordWrapping
            view.textAlignment = .center
            view.text = "⚠️"
            view.numberOfLines = 0
            parent.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 72).isActive = true
            view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 106).isActive = true
        }

        // Центральный график кисллотность
        chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        shadowColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        guard let acidityChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        acidityChart.lineWidth = 6
        acidityChart.backgroundColor = UIColor.clear
        parent.addSubview(acidityChart)
        acidityChart.translatesAutoresizingMaskIntoConstraints = false
        acidityChart.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 153).isActive = true
        acidityChart.topAnchor.constraint(equalTo: parent.topAnchor, constant: 68).isActive = true



        // Кислотность почвы
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 11)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.numberOfLines = 0
        view.text = "Кислотность\nпочвы"
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 70).isActive = true
        view.heightAnchor.constraint(equalToConstant: 27).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 149).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true


        // Число внутри графика про кислотность
        var needAcidAlert = false
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 35, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .center
        if let acidValue = params.acidity {
            view.text = String(acidValue)
            if acidValue > 80 {
                acidityChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
            } else if acidValue > 60 {
                acidityChart.strokeColor = UIColor.systemYellow
            } else if acidValue > 30 {
                acidityChart.strokeColor = UIColor.orange
            } else {
                acidityChart.strokeColor = UIColor.red
                needAcidAlert = true
            }
        } else {
            view.text = "0"
            acidityChart.strokeColor = UIColor.red
            needAcidAlert = true
        }
        acidityChart.stroke()
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 35).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: acidityChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 90).isActive = true

        // Влажность почвы алерт
        if (needAcidAlert) {
            view = UILabel()
            view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            view.backgroundColor = .clear
            view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            view.font = UIFont.systemFont(ofSize: 13)
            view.lineBreakMode = .byWordWrapping
            view.textAlignment = .center
            view.text = "⚠️"
            view.numberOfLines = 0
            parent.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 177).isActive = true
            view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 106).isActive = true
        }

        // Правый график влажность
        chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        shadowColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        guard let waterChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        waterChart.lineWidth = 6
        waterChart.backgroundColor = UIColor.clear

        parent.addSubview(waterChart)
        waterChart.translatesAutoresizingMaskIntoConstraints = false
        waterChart.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 259).isActive = true
        waterChart.topAnchor.constraint(equalTo: parent.topAnchor, constant: 68).isActive = true


        // Число внутри правого графика

        var needWaterAlert = false
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .center
        if let waterValue = params.water {
            view.text = String(Int(waterValue)) + " %"
            if waterValue > 80 {
                waterChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
            } else if waterValue > 60 {
                waterChart.strokeColor = UIColor.systemYellow
            } else if waterValue > 30 {
                waterChart.strokeColor = UIColor.orange
            } else {
                waterChart.strokeColor = UIColor.red
                needWaterAlert = true
            }
        } else {
            view.text = "0"
            waterChart.strokeColor = UIColor.red
            needWaterAlert = true
        }
        waterChart.stroke()
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: waterChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 90).isActive = true

        // Влажность почвы
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 11)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.text = "Влажность\nпочвы"
        view.numberOfLines = 0
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 70).isActive = true
        view.heightAnchor.constraint(equalToConstant: 27).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 254).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true

        // Влажность почвы алерт
        if (needWaterAlert) {
            view = UILabel()
            view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            view.backgroundColor = .clear
            view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            view.font = UIFont.systemFont(ofSize: 13)
            view.lineBreakMode = .byWordWrapping
            view.textAlignment = .center
            view.text = "⚠️"
            view.numberOfLines = 0
            parent.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 282).isActive = true
            view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 106).isActive = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
