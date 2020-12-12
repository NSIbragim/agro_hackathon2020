//
//  GHTableViewController.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import UIKit

class GHTableViewController: UITableViewController {
    let GHCellid = "GHCellid"
    let greenhouses: [GreenHouse] = [GreenHouse(temperature: 85, lightning: 85, acidity: 15, water: 15),
                                     GreenHouse(temperature: 15, lightning: 15, acidity: 65, water: 85),
                                     GreenHouse(temperature: 45, lightning: 35, acidity: 45, water: 15),
                                     GreenHouse(temperature: 85, lightning: 85, acidity: 85, water: 85)]
    var numberOfGHs = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.register(UINib.init(nibName: GHCellid, bundle: nil), forCellReuseIdentifier: GHCellid)
        self.tableView.register(GHTableViewCell.self, forCellReuseIdentifier: GHCellid)
        self.tableView.rowHeight = 191 // 175 + 8 сверху + 8 снизу
        self.tableView.tableHeaderView = UIView()
        self.tableView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: GHCellid, for: indexPath) as! GHTableViewCell
        // Configure the cell...
        print("Configuring cell number: ", indexPath.item)
        cell.setParams(params: greenhouses[indexPath.item], numberOfGH: indexPath.item)
        cell.configureUI(numberOfGH: indexPath.item)
//        cell.backgroundView = 
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
        self.tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
