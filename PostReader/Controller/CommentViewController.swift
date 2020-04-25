//
//  CommentsViewController.swift
//  PostReaderRogaTest
//
//  Created by Joao Marcus Dionisio Araujo on 23/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var commentHeaderLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var post: PostData!
    var commentModel = CommentModel(url: "https://jsonplaceholder.typicode.com/posts/")
    
    var commentData: [CommentData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        commentModel.postId = post.id
        spinner.startAnimating()
        self.commentModel.downloadCommentData{
            (result) in
            self.commentData = result
            self.commentHeaderLabel.text = "O QUE A GALERA COMENTOU SOBRE \(self.post.title ?? "")"
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "comment_cell", for: indexPath) as? CommentViewCell{
            
            let comment = commentData[indexPath.row]
            
            cell.setCellData(name: comment.name ?? "",email: comment.email ?? "" ,body: comment.body ?? "")
            return cell
        }else{
            return CommentViewCell()
        }
    }
    

}
