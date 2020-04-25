//
//  PostViewCell.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func setCellData(post: PostData){
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
