//
//  MainViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var addGHButton: UIButton!
    @IBOutlet weak var addGraphicsTable: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addGHButton.addTarget(self, action: #selector(revealAddGH), for: .touchUpInside)
        addGraphicsTable.addTarget(self, action: #selector(revealAddGraphicsTable), for: .touchUpInside)
    }

    @objc func revealAddGH() {
        let addVC = AddGHViewController()
        
        navigationController?.present(addVC, animated: true)
    }

    @objc func revealAddGraphicsTable() {
        let addVC = GHTableViewController()

        navigationController?.pushViewController(addVC, animated: true)
    }
}
