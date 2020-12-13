//
//  CalculatorViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var topIndicatorView: UIView!
    @IBOutlet weak var topCloseButton: UIButton!
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var modeSegment: UISegmentedControl!
    
    weak var modalDismissDelegate: ModalDismissDelegate?
    
    typealias Field = (UILabel, UIView, UITextField)
    
    var cropField: Field?
    var greenhouse1Field: Field?
    var timing1Field: Field?
    
    var costField: Field?
    var timing2Field: Field?
    
    @IBOutlet weak var calculateButton: UIButton!
    
    let pageVC = UIPageViewController()
    let firstVC = UIViewController()
    let secondVC = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        addPageViewConstraints()
        
        addFieldConstraints(field: cropField, in: firstVC)
        addFieldConstraints(field: greenhouse1Field, toField: cropField, in: firstVC)
        addFieldConstraints(field: timing1Field, toField: greenhouse1Field, in: firstVC)
        
        addFieldConstraints(field: costField, in: secondVC)
        addFieldConstraints(field: timing2Field, toField: costField, in: secondVC)
    }
    
    func configureView() {
        view.backgroundColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapView))
        )
        
        configureTopViews()
        configureModeSegment()
        configurePageVC()
        configureFields()
        configureCalculate()
        
        pageVC.setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
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
    
    func configureModeSegment() {
        modeSegment.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.24)
        modeSegment.tintColor = UIColor(red: 0.388, green: 0.388, blue: 0.4, alpha: 1)
        modeSegment.selectedSegmentTintColor = UIColor(red: 0.388, green: 0.388, blue: 0.4, alpha: 1)
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold),
            NSAttributedString.Key.kern: -0.24,
        ]
        
        modeSegment.setTitleTextAttributes(attributes, for: .normal)
        modeSegment.setTitle("от результата", forSegmentAt: 0)
        modeSegment.setTitle("от бюджета", forSegmentAt: 1)
        
        modeSegment.addTarget(self, action: #selector(modeSegmentChanged), for: .valueChanged)
    }
    
    @objc func modeSegmentChanged() {
        switch modeSegment.selectedSegmentIndex {
        case 0:
            pageVC.setViewControllers([firstVC], direction: .reverse, animated: false, completion: nil)
        case 1:
            pageVC.setViewControllers([secondVC], direction: .forward, animated: false, completion: nil)
        default:
            break
        }
    }
    
    func configurePageVC() {
        pageVC.delegate = self
        pageVC.dataSource = self
        
        view.addSubview(pageVC.view)
        
        addChild(pageVC)
        
        pageVC.didMove(toParent: self)
    }
    
    func addPageViewConstraints() {
        if let pageVCView = pageVC.view {
            pageVCView.translatesAutoresizingMaskIntoConstraints = false
            
            pageVCView.topAnchor.constraint(equalTo: modeSegment.bottomAnchor, constant: 32).isActive = true
            pageVCView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            pageVCView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            pageVCView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -32).isActive = true
        }
    }
    
    func configureFields() {
        cropField = field(
            title: "урожай",
            placeholder: "кг",
            action: #selector(didTapCropField),
            in: firstVC
        )
        
        greenhouse1Field = field(
            title: "теплицы",
            placeholder: "шт",
            action: #selector(didTapGreenhouse1Field),
            in: firstVC
        )
        
        timing1Field = field(
            title: "срок",
            placeholder: "мес",
            action: #selector(didTapTiming1Field),
            in: firstVC
        )
        
        costField = field(
            title: "бюджет",
            placeholder: "₽",
            action: #selector(didTapCostField),
            in: secondVC
        )
        
        timing2Field = field(
            title: "срок",
            placeholder: "мес",
            action: #selector(didTapTiming2Field),
            in: secondVC
        )
    }
    
    @objc func didTapCropField() {
        cropField?.2.becomeFirstResponder()
    }
    
    @objc func didTapGreenhouse1Field() {
        greenhouse1Field?.2.becomeFirstResponder()
    }
    
    @objc func didTapTiming1Field() {
        timing1Field?.2.becomeFirstResponder()
    }
    
    @objc func didTapCostField() {
        costField?.2.becomeFirstResponder()
    }
    
    @objc func didTapTiming2Field() {
        timing2Field?.2.becomeFirstResponder()
    }
    
    func configureCalculate() {
        calculateButton.setBackgroundColor(
            UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1),
            for: .normal
        )
        
        calculateButton.setBackgroundColor(
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
        
        calculateButton.setAttributedTitle(
            NSAttributedString(string: "Рассчитать", attributes: normalAttributes),
            for: .normal
        )
        
        calculateButton.setAttributedTitle(
            NSAttributedString(string: "Рассчитать", attributes: highlightedAttributes),
            for: .highlighted
        )
        
        calculateButton.layer.cornerRadius = 8
        calculateButton.layer.masksToBounds = true
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }
    
    @objc func calculate() {
        let resultVC = CalculatorResultViewController()
        
        resultVC.modalDismissDelegate = modalDismissDelegate
        
        present(resultVC, animated: true, completion: nil)
    }
    
    func field(title: String, placeholder: String, action: Selector, in viewController: UIViewController) -> Field {
        let titleLabel = UILabel()
        let titleFieldView = UIView()
        let titleField = UITextField()
        
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
            string: title,
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
            UITapGestureRecognizer(target: self, action: action)
        )
        
        titleField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: placeholderAttributes
        )
        
        titleField.typingAttributes = textAttributes
        titleField.defaultTextAttributes = textAttributes
        
        viewController.view.addSubview(titleLabel)
        viewController.view.addSubview(titleFieldView)
        viewController.view.addSubview(titleField)
        
        return (titleLabel, titleFieldView, titleField)
    }
    
    func addFieldConstraints(field: Field?, in viewController: UIViewController) {
        if let field = field, let view = viewController.view {
            field.0.translatesAutoresizingMaskIntoConstraints = false
            field.1.translatesAutoresizingMaskIntoConstraints = false
            field.2.translatesAutoresizingMaskIntoConstraints = false
            
            field.0.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            field.0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            
            field.1.topAnchor.constraint(equalTo: field.0.bottomAnchor, constant: 8).isActive = true
            field.1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            field.1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            field.1.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            field.2.topAnchor.constraint(equalTo: field.1.topAnchor, constant: 13).isActive = true
            field.2.leadingAnchor.constraint(equalTo: field.1.leadingAnchor, constant: 16).isActive = true
            field.2.trailingAnchor.constraint(equalTo: field.1.trailingAnchor, constant: -16).isActive = true
            field.2.bottomAnchor.constraint(equalTo: field.1.bottomAnchor, constant: -13).isActive = true
        }
    }
    
    func addFieldConstraints(field: Field?, toField: Field?, in viewController: UIViewController) {
        if let field = field, let toField = toField, let view = viewController.view {
            field.0.translatesAutoresizingMaskIntoConstraints = false
            field.1.translatesAutoresizingMaskIntoConstraints = false
            field.2.translatesAutoresizingMaskIntoConstraints = false
            
            field.0.topAnchor.constraint(equalTo: toField.1.bottomAnchor, constant: 24).isActive = true
            field.0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            
            field.1.topAnchor.constraint(equalTo: field.0.bottomAnchor, constant: 8).isActive = true
            field.1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            field.1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            field.1.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            field.2.topAnchor.constraint(equalTo: field.1.topAnchor, constant: 13).isActive = true
            field.2.leadingAnchor.constraint(equalTo: field.1.leadingAnchor, constant: 16).isActive = true
            field.2.trailingAnchor.constraint(equalTo: field.1.trailingAnchor, constant: -16).isActive = true
            field.2.bottomAnchor.constraint(equalTo: field.1.bottomAnchor, constant: -13).isActive = true
        }
    }
}
