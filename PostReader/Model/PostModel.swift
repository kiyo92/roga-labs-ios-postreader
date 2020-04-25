//
//  PostModel.swift
//  PostReader
//
//  Created by Joao Marcus Dionisio Araujo on 24/04/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireNetworkActivityIndicator

class PostModel {
    var url : String
    init(_ url : String) {
        self.url = url
        
        
    }
    //funcão que vai nos retornar os dados dos posts
    func downloadPostData(result: @escaping (_:[PostData]) -> Void){
        var posts:[PostData] = []
        //Iniciando requisição
        AF.request(url).responseJSON{
            response in
            //Tratando dados com base na estrura referente em Model/DataModel
            if let data = response.value{
                if let postsData = data as? [Dictionary<String,Any>]{
                    for post in postsData{
                        let p = PostData(postData: post)
                        posts.append(p)
                    }
                }
                result(posts)
            }
            
        }
        
    }
    
}
