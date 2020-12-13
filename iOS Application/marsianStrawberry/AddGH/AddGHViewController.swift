//
//  AddGHViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class AddGHViewController: UIViewController {
    @IBOutlet weak var topIndicatorView: UIView!
    @IBOutlet weak var topCloseButton: UIButton!
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleFieldView: UIView!
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var sensorsTitleLabel: UILabel!
    
    @IBOutlet weak var temperatureTitleLabel: UILabel!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    @IBOutlet weak var temperatureSlider: CustomSlider!
    
    @IBOutlet weak var lightingTitleLabel: UILabel!
    @IBOutlet weak var lightingValueLabel: UILabel!
    @IBOutlet weak var lightingSlider: CustomSlider!
    
    @IBOutlet weak var humidityTitleLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var humiditySlider: CustomSlider!
    
    @IBOutlet weak var addButton: UIButton!
    
    var temperature: Int {
        Int(temperatureSlider.value)
    }
    
    var lighting: Int {
        Int(lightingSlider.value)
    }
    
    var humidity: Int {
        Int(humiditySlider.value)
    }
    
    var gh: GreenHouse? {
        didSet {
            guard let temperature = gh?.temperature,
                  let lighting = gh?.lightning,
                  let water = gh?.water else { return }
            
            temperatureSlider.setValue(temperature, animated: true)
            lightingSlider.setValue(lighting, animated: true)
            humiditySlider.setValue(water, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapView))
        )
        
        configureTopViews()
        configureTitle()
        configureSensors()
        configureTemperature()
        configureLighting()
        configureHumidity()
        configureAdd()
    }
    
    @objc func didTapView() {
        view.endEditing(false)
    }
    
    func configureTopViews() {
        topIndicatorView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        topIndicatorView.layer.cornerRadius = 2
        
        topCloseButton.tintColor = UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)
        
        let image = UIImage(
            systemName: "xmark",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)
        )
        
        topCloseButton.setImage(image, for: .normal)
        
        topCloseButton.addTarget(
            self,
            action: #selector(didTouchUpInsideCloseButton),
            for: .touchUpInside
        )
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.08
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        topTitleLabel.attributedText = NSAttributedString(
            string: "Добавить теплицу",
            attributes: attributes
        )
    }
    
    @objc func didTouchUpInsideCloseButton() {
        dismiss(animated: true)
    }
    
    func configureTitle() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let labelAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        titleLabel.attributedText = NSAttributedString(
            string: "Имя теплицы",
            attributes: labelAttributes
        )
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.279, green: 0.279, blue: 0.279, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        titleFieldView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        titleFieldView.layer.cornerRadius = 10
        
        titleFieldView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapTitleField))
        )
        
        titleField.attributedPlaceholder = NSAttributedString(
            string: "BFL46CFCJ2",
            attributes: placeholderAttributes
        )
        
        titleField.typingAttributes = textAttributes
        titleField.defaultTextAttributes = textAttributes
    }
    
    @objc func didTapTitleField() {
        titleField.becomeFirstResponder()
    }
    
    func configureSensors() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 24
        paragraphStyle.maximumLineHeight = 24
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        sensorsTitleLabel.attributedText = NSAttributedString(
            string: "Показатели:",
            attributes: titleAttributes
        )
    }
    
    func configureTemperature() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let valueAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        temperatureTitleLabel.attributedText = NSAttributedString(
            string: "Освещение",
            attributes: titleAttributes
        )
        
        temperatureValueLabel.attributedText = NSAttributedString(
            string: "12 фот",
            attributes: valueAttributes
        )
        
        temperatureSlider.minimumValue = -100
        temperatureSlider.maximumValue = 100
        temperatureSlider.value = 23
        
        temperatureSlider.addTarget(self, action: #selector(temperatureChanged), for: .valueChanged)
        
        temperatureChanged()
    }
    
    @objc func temperatureChanged() {
        temperatureValueLabel.text = "\(temperature) фот"
    }
    
    func configureLighting() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let valueAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        lightingTitleLabel.attributedText = NSAttributedString(
            string: "Кислотность",
            attributes: titleAttributes
        )
        
        lightingValueLabel.attributedText = NSAttributedString(
            string: "5ph",
            attributes: valueAttributes
        )
        
        lightingSlider.minimumValue = 0
        lightingSlider.maximumValue = 100
        lightingSlider.value = 5
        
        lightingSlider.addTarget(self, action: #selector(lightingChanged), for: .valueChanged)
        
        lightingChanged()
    }
    
    @objc func lightingChanged() {
        lightingValueLabel.text = "\(lighting)ph"
    }
    
    func configureHumidity() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let valueAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.kern: -0.24,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        humidityTitleLabel.attributedText = NSAttributedString(
            string: "Влажность",
            attributes: titleAttributes
        )
        
        humidityValueLabel.attributedText = NSAttributedString(
            string: "25 %",
            attributes: valueAttributes
        )
        
        humiditySlider.minimumValue = 0
        humiditySlider.maximumValue = 100
        humiditySlider.value = 75
        
        humiditySlider.addTarget(self, action: #selector(humidityChanged), for: .valueChanged)
        
        humidityChanged()
    }
    
    @objc func humidityChanged() {
        humidityValueLabel.text = "\(humidity) %"
    }
    
    func configureAdd() {
        addButton.setBackgroundColor(
            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1),
            for: .normal
        )
        
        addButton.setBackgroundColor(
            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1).highlighted,
            for: .highlighted
        )
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let highlightedAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        addButton.setAttributedTitle(
            NSAttributedString(string: "Добавить", attributes: normalAttributes),
            for: .normal
        )
        
        addButton.setAttributedTitle(
            NSAttributedString(string: "Добавить", attributes: highlightedAttributes),
            for: .highlighted
        )
        
        addButton.layer.cornerRadius = 8
        addButton.layer.masksToBounds = true
        
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
    }
    
    @objc func add() {
        dismiss(animated: true, completion: nil)
    }
}
