//
//  PostData.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
struct PostData : Codable{
    var userId:Int?
    var id:Int?
    var title:String?
    var body: String?

    init(postData : Dictionary<String,Any>) {
        if let u = postData["userId"] as? Int{
            self.userId = u
        }
        if let i = postData["id"] as? Int{
            self.id = i
        }
        if let t = postData["title"] as? String{
            self.title = t
        }
        if let b = postData["body"] as? String{
            self.body = b
        }

    }
}
