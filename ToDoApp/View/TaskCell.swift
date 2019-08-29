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
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
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
            let dateString = dateFormatter.string(from: task.date)
            self.dateLabel.text = dateString
            self.titleLabel.text = task.title
            self.locationLabel.text = task.location?.name
        }
        
    }
}
