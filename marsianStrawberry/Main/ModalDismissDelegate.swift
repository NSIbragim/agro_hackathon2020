//
//  ModalDismissDelegate.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 12.12.2020.
//

import UIKit

protocol ModalDismissDelegate: class {
    func dismissAll(animated: Bool)
}

extension MainViewController: ModalDismissDelegate {
    func dismissAll(animated: Bool) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
