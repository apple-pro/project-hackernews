//
//  HackerNewsAPI.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/1/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import Foundation

class HackerNewsAPI {
    
    let searchUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    func search() {
        if let url = URL(string: searchUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        let result = try! decoder.decode(SearchResults.self, from: safeData)
                    }
                    
                }
            }
            task.resume()
        }
    }
}

struct SearchResults: Decodable {
    
    let hits: [Post]
}

struct Post: Identifiable, Decodable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let url: String
    
}
