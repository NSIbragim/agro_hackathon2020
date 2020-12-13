//
//  GHTableViewController.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import UIKit

class GHTableViewController: UITableViewController, ModalDismissDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    let GHCellID = "GHCellID"
    let HeaderCellID = "HeaderCellID"

    let greenhouses: [GreenHouse] = [GreenHouse(temperature: 85, lightning: 85, acidity: 15, water: 15),
                                     GreenHouse(temperature: 15, lightning: 15, acidity: 65, water: 85),
                                     GreenHouse(temperature: 45, lightning: 35, acidity: 45, water: 15),
                                     GreenHouse(temperature: 85, lightning: 85, acidity: 85, water: 85),
                                     GreenHouse(temperature: 85, lightning: 85, acidity: 85, water: 85),
                                     GreenHouse(temperature: 85, lightning: 85, acidity: 85, water: 85),
                                     GreenHouse(temperature: 85, lightning: 85, acidity: 85, water: 85)]
    let harvestParams = Harvest(targetWeight: 1000, money: 100_000, collectedWeight: 426, wastedMoney: 30_000, distance: 36)

    var numberOfGHs = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tableView.tableHeaderView = UIView()
        self.tableView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.separatorColor = .clear
        
        //create a button or any UIView and add to subview
        let button=UIButton.init(type: .system)
        button.setTitle("Настроить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.frame.size = CGSize(width: 100, height: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 0, green: 0.396, blue: 0.521, alpha: 1)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        //set constrains
        button.translatesAutoresizingMaskIntoConstraints = false
        button.rightAnchor.constraint(equalTo: tableView.layoutMarginsGuide.rightAnchor, constant: 0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 335).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.leftAnchor.constraint(equalTo: tableView.layoutMarginsGuide.leftAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: tableView.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func didTapButton() {
        let calculatorVC = CalculatorViewController()
        
        calculatorVC.modalDismissDelegate = self
        
        navigationController?.present(calculatorVC, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return greenhouses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item == 0){
            self.tableView.register(HeaderTablewViewCell.self, forCellReuseIdentifier: HeaderCellID)

            if greenhouses.count < 5 {
                self.tableView.rowHeight = 300
            } else {
                self.tableView.rowHeight = 250
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellID, for: indexPath) as! HeaderTablewViewCell
            cell.selectionStyle = .none
            cell.setParams(params: harvestParams, numberOfGH: greenhouses.count)
            cell.configureUI()
            return cell
        } else if indexPath.item < greenhouses.count - 1 {

            self.tableView.register(GHTableViewCell.self, forCellReuseIdentifier: GHCellID)

            self.tableView.rowHeight = 191 // 175 + 8 сверху + 8 снизу
            let cell = tableView.dequeueReusableCell(withIdentifier: GHCellID, for: indexPath) as! GHTableViewCell
            // Configure the cell...
            cell.selectionStyle = .none

            print("Configuring cell number: ", indexPath.item)
            cell.setParams(params: greenhouses[indexPath.item - 1], numberOfGH: indexPath.item)
            cell.configureUI()
            return cell
        } else {
            // костыльное программирование
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            cell.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
            self.tableView.rowHeight = 80
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
        self.tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        
        if indexPath.item == 0 {
            let addGHVC = AddGHViewController()
            
            navigationController?.present(addGHVC, animated: true, completion: nil)
        }
        
        if (indexPath.item > 0) && (indexPath.item < greenhouses.count - 1){
            let moreInfoVC = GHMoreInfoViewController()
            moreInfoVC.setParams(params: greenhouses[indexPath.item - 1], numberOfGH: indexPath.item)
            navigationController?.pushViewController(moreInfoVC, animated: true)
        }
    }
    
    func dismissAll(animated: Bool) {
        navigationController?.dismiss(animated: animated, completion: nil)
    }
}
