//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Daniyar Erkinov on 8/28/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }()
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
        } else {
            if let date = task.date {
                let dateString = dateFormatter.string(from: date)
                self.dateLabel.text = dateString
            }
            
            self.titleLabel.text = task.title
            self.locationLabel.text = task.location?.name
        }
        
    }
}
