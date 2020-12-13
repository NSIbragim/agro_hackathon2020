//
//  GHMoreInfoViewController.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 13.12.2020.
//

import UIKit
import PNChart
import SwiftUI

class GHMoreInfoViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    var params = GreenHouse(temperature: 0, lightning: 0, acidity: 0, water: 0)
    var numberOfGH = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func setParams(params: GreenHouse, numberOfGH: Int) {
        self.params = params
        self.numberOfGH = numberOfGH
    }

    private func configureUI(){
        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)

        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 0, green: 0.545, blue: 0.717, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "+23°"
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 63).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        view.backgroundColor = .clear
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "Теплица №" + String(numberOfGH)
        view.sizeToFit()
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 63).isActive = true
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        setupLightUI()
        setupAcidUI()
        setupWaterUI()
        configureTopButtonUI()
        configureImage()
        configureMidButtonUI()
        configureBotButtonUI()
    }

    func setupLightUI(){
        // Освещение

        let chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        let shadowColor = UIColor(red: 0.262, green: 0.262, blue: 0.262, alpha: 1)
        guard let lightChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        lightChart.lineWidth = 6
        lightChart.backgroundColor = UIColor.clear

        self.view.addSubview(lightChart)
        lightChart.translatesAutoresizingMaskIntoConstraints = false
        lightChart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 310).isActive = true // 259
        lightChart.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 119).isActive = true // 68

        let normaView = UILabel()
        normaView.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        normaView.backgroundColor = .clear
        normaView.font = UIFont.systemFont(ofSize: 15)
        normaView.lineBreakMode = .byWordWrapping
        normaView.textAlignment = .center
        normaView.numberOfLines = 0

        var needWaterAlert = false
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .center
        if let waterValue = params.lightning {
            view.text = String(Int(waterValue)) + " фот"
            if waterValue > 80 {
                lightChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.textColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.text = "норма"
            } else if waterValue > 60 {
                lightChart.strokeColor = UIColor.systemYellow
                normaView.textColor = UIColor.systemYellow
                normaView.text = "отклонение"
            } else if waterValue > 30 {
                lightChart.strokeColor = UIColor.orange
                normaView.textColor = UIColor.orange
                normaView.text = "отклонение"
            } else {
                lightChart.strokeColor = UIColor.red
                normaView.textColor = UIColor.red
                normaView.text = "отклонение"
                needWaterAlert = true
            }
        } else {
            view.text = "0"
            lightChart.strokeColor = UIColor.red
            normaView.textColor = UIColor.red
            normaView.text = "отклонение"
            needWaterAlert = true
        }
        self.view.addSubview(normaView)
        normaView.translatesAutoresizingMaskIntoConstraints = false
        normaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        normaView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 152).isActive = true
        lightChart.stroke()
        self.view.addSubview(view)
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: lightChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 141).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.text = "Освещение"
        view.numberOfLines = 0
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128).isActive = true

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
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 318).isActive = true
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 157).isActive = true
        }
    }

    func setupAcidUI(){
        // Кислотность

        let chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        let shadowColor = UIColor(red: 0.262, green: 0.262, blue: 0.262, alpha: 1)
        guard let acidChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        acidChart.lineWidth = 6
        acidChart.backgroundColor = UIColor.clear

        self.view.addSubview(acidChart)
        acidChart.translatesAutoresizingMaskIntoConstraints = false
        acidChart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 310).isActive = true // 259
        acidChart.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 203).isActive = true // 68

        let normaView = UILabel()
        normaView.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        normaView.backgroundColor = .clear
        normaView.font = UIFont.systemFont(ofSize: 15)
        normaView.lineBreakMode = .byWordWrapping
        normaView.textAlignment = .center
        normaView.numberOfLines = 0

        var needWaterAlert = false
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .center
        if let waterValue = params.acidity {
            view.text = String(Int(waterValue)) + " pH"
            if waterValue > 80 {
                acidChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.textColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.text = "норма"
            } else if waterValue > 60 {
                acidChart.strokeColor = UIColor.systemYellow
                normaView.textColor = UIColor.systemYellow
                normaView.text = "отклонение"
            } else if waterValue > 30 {
                acidChart.strokeColor = UIColor.orange
                normaView.textColor = UIColor.orange
                normaView.text = "отклонение"
            } else {
                acidChart.strokeColor = UIColor.red
                normaView.textColor = UIColor.red
                normaView.text = "отклонение"
                needWaterAlert = true
            }
        } else {
            view.text = "0"
            acidChart.strokeColor = UIColor.red
            normaView.textColor = UIColor.red
            normaView.text = "отклонение"
            needWaterAlert = true
        }
        self.view.addSubview(normaView)
        normaView.translatesAutoresizingMaskIntoConstraints = false
        normaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        normaView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 236).isActive = true
        acidChart.stroke()
        self.view.addSubview(view)
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: acidChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 225).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.text = "Кислотность почвы"
        view.numberOfLines = 0
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 212).isActive = true

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
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 318).isActive = true
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 241).isActive = true
        }
    }

    func setupWaterUI(){
        // Влажность

        let chartFrame = CGRect(x: 25, y: 25, width: 60, height: 60)
        let shadowColor = UIColor(red: 0.262, green: 0.262, blue: 0.262, alpha: 1)
        guard let waterChart = PNCircleChart.init(frame: chartFrame, total: 75, current: 35, clockwise: true, shadow: true, shadowColor: shadowColor, displayCountingLabel: false) else {
            return
        }
        waterChart.lineWidth = 6
        waterChart.backgroundColor = UIColor.clear

        self.view.addSubview(waterChart)
        waterChart.translatesAutoresizingMaskIntoConstraints = false
        waterChart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 310).isActive = true // 259
        waterChart.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 287).isActive = true // 68

        let normaView = UILabel()
        normaView.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        normaView.backgroundColor = .clear
        normaView.font = UIFont.systemFont(ofSize: 15)
        normaView.lineBreakMode = .byWordWrapping
        normaView.textAlignment = .center
        normaView.numberOfLines = 0

        var needWaterAlert = false
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 16)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .center
        if let waterValue = params.water {
            view.text = String(Int(waterValue)) + " %"
            if waterValue > 80 {
                waterChart.strokeColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.textColor = UIColor(red: 0.061, green: 0.762, blue: 0, alpha: 1)
                normaView.text = "норма"
            } else if waterValue > 60 {
                waterChart.strokeColor = UIColor.systemYellow
                normaView.textColor = UIColor.systemYellow
                normaView.text = "отклонение"
            } else if waterValue > 30 {
                waterChart.strokeColor = UIColor.orange
                normaView.textColor = UIColor.orange
                normaView.text = "отклонение"
            } else {
                waterChart.strokeColor = UIColor.red
                normaView.textColor = UIColor.red
                normaView.text = "отклонение"
                needWaterAlert = true
            }
        } else {
            view.text = "0"
            waterChart.strokeColor = UIColor.red
            normaView.textColor = UIColor.red
            normaView.text = "отклонение"
            needWaterAlert = true
        }
        self.view.addSubview(normaView)
        normaView.translatesAutoresizingMaskIntoConstraints = false
        normaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        normaView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 320).isActive = true
        waterChart.stroke()
        self.view.addSubview(view)
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.centerXAnchor.constraint(equalTo: waterChart.centerXAnchor, constant: 30).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 309).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.text = "Влажность почвы"
        view.numberOfLines = 0
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 296).isActive = true

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
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 27).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 318).isActive = true
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 325).isActive = true
        }
    }

    func configureTopButtonUI(){
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 50)
        view.backgroundColor = .clear
        view.layer.backgroundColor = UIColor(red: 0.196, green: 0.196, blue: 0.196, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        var parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 379).isActive = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 144, height: 18)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "История изменений"
        view.sizeToFit()
        parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 396).isActive = true

        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        imageView.backgroundColor = .clear
        let color = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)
        let imageIcon = UIImage(systemName: "chevron.forward")?.withTintColor(color, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        imageView.sizeToFit()
        parent = self.view!
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 340).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func configureMidButtonUI(){
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 50)
        view.backgroundColor = .clear
        view.layer.backgroundColor = UIColor(red: 0.196, green: 0.196, blue: 0.196, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        var parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 638).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 144, height: 18)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "Полив через два часа"
        view.sizeToFit()
        parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 655).isActive = true

        let perDayLabel = UILabel()
        perDayLabel.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        perDayLabel.backgroundColor = .clear
        perDayLabel.font = UIFont.systemFont(ofSize: 13)
        let color = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)
        perDayLabel.textColor = color
        perDayLabel.text = "8 ч/день"
        perDayLabel.sizeToFit()
        parent = self.view!
        parent.addSubview(perDayLabel)
        perDayLabel.sizeToFit()
        perDayLabel.translatesAutoresizingMaskIntoConstraints = false
        perDayLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        perDayLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 300).isActive = true
        perDayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func configureImage(){
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 175)
        imageView.backgroundColor = .clear
        var imageIcon = UIImage(named: "MoreInfoPhoto")
        imageView.image = imageIcon
        imageView.sizeToFit()
        let parent = self.view!
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 450).isActive = true
        imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true

        imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        imageView.layer.cornerRadius = 2
        imageIcon = UIImage(systemName: "cloud.rain")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        imageView.sizeToFit()
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 595).isActive = true
        imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 120).isActive = true

        imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        imageView.layer.cornerRadius = 2
        imageIcon = UIImage(systemName: "lightbulb.slash")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        imageView.sizeToFit()
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 595).isActive = true
        imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 150).isActive = true

        imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        imageView.layer.cornerRadius = 2
        imageIcon = UIImage(systemName: "viewfinder")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        imageView.sizeToFit()
        parent.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 455).isActive = true
        imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 150).isActive = true
    }

    func configureBotButtonUI(){

        let button=UIButton.init(type: .system)
        button.setTitle("Ручное управление", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.frame.size = CGSize(width: 100, height: 50)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.backgroundColor = UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)
        self.view.addSubview(button)

        //set constrains
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 350).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 700).isActive = true
    }


    @objc func buttonTapped(){
        let swiftUIView = ContentView()
        let childView = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(childView, animated: true)
    }
}
