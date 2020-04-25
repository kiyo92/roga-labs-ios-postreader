//
//  PostModel.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire

class CommentModel {
    var postId : Int?
    var url : String
    
    init(url : String) {
        self.url = url

    }
    
    func downloadCommentData(result: @escaping (_:[CommentData]) -> Void){
        var comments:[CommentData] = []
        print("mopa")
        AF.request("\(url)\(postId ?? -1)/comments").responseJSON{
            response in
            
            if let data = response.value{
                if let commentsData = data as? [Dictionary<String,Any>]{
                    for comment in commentsData{
                        let c = CommentData(commentData: comment)
                        comments.append(c)
                    }
                }
                result(comments)
            }
            
        }
        
    }
    
}
