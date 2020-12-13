//
//  NotificationsViewController+UITableViewDataSource.swift
//  marsianStrawberry
//
//  Created by Nikita Arutyunov on 13.12.2020.
//

import UIKit

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NotificationTableViewCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.alignment = .left
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let images = [
            UIImage(systemName: "exclamationmark.triangle")?.withTintColor(UIColor(red: 0.846, green: 0.66, blue: 0, alpha: 1)).withRenderingMode(.alwaysOriginal),
            UIImage(systemName: "checkmark.circle")?.withTintColor(UIColor(red: 0.186, green: 0.717, blue: 0, alpha: 1)).withRenderingMode(.alwaysOriginal),
            UIImage(systemName: "checkmark.circle")?.withTintColor(UIColor(red: 0.186, green: 0.717, blue: 0, alpha: 1)).withRenderingMode(.alwaysOriginal),
        ]
        
        let strings = [
            "В теплице №2 резко уменьшилась влажность почвы",
            "Достигнута 1/3 цели по урожайности клубники",
            "Началось цветение клубники",
        ]
        
        cell.update(
            image: images[indexPath.item],
            text: NSAttributedString(string: strings[indexPath.item], attributes: attributes)
        )
        
        return cell
    }
}
