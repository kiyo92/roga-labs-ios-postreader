//
//  CommentData.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
struct CommentData : Codable{
    var postId:Int?
    var id:Int?
    var name:String?
    var email: String?
    var body: String?
    
    init(commentData : Dictionary<String,Any>) {
        if let postId = commentData["postId"] as? Int{
            self.postId = postId
        }
        if let id = commentData["id"] as? Int{
            self.id = id
        }
        if let name = commentData["name"] as? String{
            self.name = name
        }
        if let email = commentData["email"] as? String{
            self.email = email
        }
        if let body = commentData["body"] as? String{
            self.body = body
        }
        
    }
 
}
