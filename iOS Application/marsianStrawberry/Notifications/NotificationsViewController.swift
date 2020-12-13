//
//  NotificationsViewController.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 13.12.2020.
//

import UIKit

class NotificationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = 76
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func configureView() {
        title = "Уведомления"
        tabBarItem.title = ""
        
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapView))
        )
    }
    
    @objc func didTapView() {
        view.endEditing(false)
    }
}
