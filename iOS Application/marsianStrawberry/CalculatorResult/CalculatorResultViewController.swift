//
//  CalculatorResultViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class CalculatorResultViewController: UIViewController {
    @IBOutlet weak var topIndicatorView: UIView!
    @IBOutlet weak var topCloseButton: UIButton!
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var timingLabel: UILabel!
    
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var costTitleLabel: UILabel!
    @IBOutlet weak var costValueLabel: UILabel!
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    weak var modalDismissDelegate: ModalDismissDelegate?
    
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
        configureInput()
        configureOutput()
        configureApply()
        configureCancel()
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
            string: "Настройка плантации",
            attributes: attributes
        )
    }
    
    @objc func didTouchUpInsideCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureTitle() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 24
        paragraphStyle.maximumLineHeight = 24
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold),
//            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        titleLabel.attributedText = NSAttributedString(
            string: "7500 кг клубники",
            attributes: attributes
        )
    }
    
    func configureInput() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
//            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        countLabel.attributedText = NSAttributedString(
            string: "5 теплиц",
            attributes: attributes
        )
        
        timingLabel.attributedText = NSAttributedString(
            string: "3 месяца",
            attributes: attributes
        )
    }
    
    func configureOutput() {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .center
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        costTitleLabel.attributedText = NSAttributedString(
            string: "Стоимость",
            attributes: attributes
        )
        
        costValueLabel.attributedText = NSAttributedString(
            string: "100000 ₽",
            attributes: attributes
        )
    }
    
    func configureApply() {
        applyButton.setBackgroundColor(
            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1),
            for: .normal
        )
        
        applyButton.setBackgroundColor(
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
        
        applyButton.setAttributedTitle(
            NSAttributedString(string: "Применить", attributes: normalAttributes),
            for: .normal
        )
        
        applyButton.setAttributedTitle(
            NSAttributedString(string: "Применить", attributes: highlightedAttributes),
            for: .highlighted
        )
        
        applyButton.layer.cornerRadius = 8
        applyButton.layer.masksToBounds = true
        
        applyButton.addTarget(self, action: #selector(apply), for: .touchUpInside)
    }
    
    @objc func apply() {
        modalDismissDelegate?.dismissAll(animated: true)
    }
    
    func configureCancel() {
//        cancelButton.setBackgroundColor(
//            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1),
//            for: .normal
//        )
//
//        cancelButton.setBackgroundColor(
//            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1).highlighted,
//            for: .highlighted
//        )
        
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
            NSAttributedString.Key.foregroundColor: UIColor.white.textHighlighted,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        cancelButton.setAttributedTitle(
            NSAttributedString(string: "Отменить", attributes: normalAttributes),
            for: .normal
        )
        
        cancelButton.setAttributedTitle(
            NSAttributedString(string: "Отменить", attributes: highlightedAttributes),
            for: .highlighted
        )
        
        cancelButton.layer.cornerRadius = 8
        cancelButton.layer.masksToBounds = true
        
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
