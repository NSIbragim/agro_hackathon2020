//
//  MainViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var addGHButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addGHButton.addTarget(self, action: #selector(revealAddGH), for: .touchUpInside)
    }

    @objc func revealAddGH() {
        let addGHVC = CalculatorViewController()
        
        navigationController?.present(addGHVC, animated: true)
    }
}
