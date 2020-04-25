//
//  PostViewController.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    var posts : [PostData] = []
    var postModel = PostModel("https://jsonplaceholder.typicode.com/posts")
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        spinner.startAnimating()
        //Chamando o metodo que vai acessar a api
        postModel.downloadPostData{
            (result) in
            self.posts = result
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
        

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //criando celula referente ao modelo criado em Controller/ViewComponents
        if let cell = tableView.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as? PostViewCell{
            let post = posts[indexPath.row]
            cell.setCellData(post: post)
            return cell
        }else{
            return PostViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts [indexPath.row]
        performSegue(withIdentifier: "post_cell", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "post_cell"{
            if let destination = segue.destination as? CommentViewController{
                if let post = sender as? PostData{
                    destination.post = post
                }
            }
        }
    }

}
