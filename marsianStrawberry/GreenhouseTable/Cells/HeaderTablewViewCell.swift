//
//  HeaderTablewViewCell.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import UIKit

class HeaderTablewViewCell: UITableViewCell {

    var params = Harvest(targetWeight: 0, money: 0, collectedWeight: 0, wastedMoney: 0, distance: 0)
    var numberOfGH = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setParams(params: Harvest, numberOfGH: Int) {
        self.params = params
        self.numberOfGH = numberOfGH
    }

    func configureUI() {
        self.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)


        // Градусы
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 0, green: 0.545, blue: 0.717, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "+23°"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        view.backgroundColor = .clear
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "Моя плантация"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true

        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 27, height: 20)
        imageView.backgroundColor = .clear
        let imageColor = UIColor(red: 0, green: 0.545, blue: 0.717, alpha: 1)
        let imageIcon = UIImage(systemName: "plus.circle")?.withTintColor(imageColor, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true

        // label
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 42, height: 20)
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = "Цель"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 42).isActive = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true

        // Клубника 1000 кг
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Клубника"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 86).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  .white
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "100 кг"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true

        // Срок 36 мес
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Срок"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 86).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  .white
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "36 мес"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true

        // Бюджет 100 000 ₽
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Бюджет"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 260).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 86).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  .white
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "100 000 ₽"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 260).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true


        // line
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 335, height: 7)
        view.layer.backgroundColor = UIColor(red: 0.204, green: 0.204, blue: 0.204, alpha: 1).cgColor
        view.layer.cornerRadius = 4
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 335).isActive = true
        view.heightAnchor.constraint(equalToConstant: 7).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 110, height: 7)
        view.layer.backgroundColor = UIColor(red: 0, green: 0.545, blue: 0.717, alpha: 1).cgColor
        view.layer.cornerRadius = 4
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 110).isActive = true
        view.heightAnchor.constraint(equalToConstant: 7).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true

        // underline
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Собрано 426 кг"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 174).isActive = true

        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Потрачено 30 000 ₽"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 156).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 174).isActive = true

        // more button
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        view.backgroundColor = .clear
        view.textColor =  UIColor(red: 0, green: 0.545, blue: 0.717, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 13)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Подробнее"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true

        // one more line
        view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 335, height: 1)
        view.layer.backgroundColor = UIColor(red: 0.162, green: 0.162, blue: 0.162, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 228).isActive = true

        if numberOfGH < 5 {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 335, height: 70)
            button.layer.cornerRadius = 10
            button.layer.backgroundColor = UIColor(red: 0, green: 0.206, blue: 0.271, alpha: 1).cgColor
            var btnTitle = "⚠️ Для достижения цели\nнужны теплицы"
            switch (numberOfGH){
            case 1:
                btnTitle = "⚠️ Для достижения цели\nнужны еще четыре теплицы"
            case 2:
                btnTitle = "⚠️ Для достижения цели\nнужны еще три теплицы"
            case 3:
                btnTitle = "⚠️ Для достижения цели\nнужны еще две теплицы"
            case 4:
                btnTitle = "⚠️ Для достижения цели\nнужна еще одна теплица"
            default:
                btnTitle = "⚠️ Для достижения цели\nнужны теплицы"
            }
            button.setTitle(btnTitle, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.titleLabel?.numberOfLines = 0

            self.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 335).isActive = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 238).isActive = true
        }
    }
    

}
