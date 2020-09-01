//
//  HackerNewsAPI.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/1/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import Foundation

class HackerNewsAPI: ObservableObject {
    
    @Published var posts = [Post]()
    
    let searchUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    func search() {
        if let url = URL(string: searchUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        let result = try! decoder.decode(SearchResults.self, from: safeData)
                        
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                    }
                    
                }
            }
            task.resume()
        }
    }
}

let samplePosts = [
    
    Post(objectID: "24334731",
         title: "Supporting Linux kernel development in Rust",
         url: "https://lwn.net/SubscriberLink/829858/281103f9c6fd0dc2/",
         author: "dochtman",
         _tags: [
            "story",
            "author_dochtman",
            "story_24334731",
            "front_page"
        ]
    ),
    
    Post(objectID: "10002",
         title: "Applebot",
         url: "https://google.com",
         author: "jonbaer",
         _tags: [
            "story",
            "author_jonbaer",
            "story_24338152",
            "front_page"
        ]
    ),
    
    Post(objectID: "10003",
         title: "App Review process updates",
         url: nil,
         author: "BigBalli",
         _tags: [
            "story",
            "author_BigBalli",
            "story_24332412",
            "front_page"
        ]
    )
]

struct SearchResults: Decodable {
    
    let hits: [Post]
}

struct Post: Identifiable, Decodable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let url: String?
    let author: String
    let _tags: [String]
    
}
