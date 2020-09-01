//
//  ContentView.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/1/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var hackerNews = HackerNewsAPI()

    var body: some View {
        NavigationView {
            List(hackerNews.posts) { post in
                PostCell(post: post)
                }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.hackerNews.search()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var cv = ContentView()
        let hn = HackerNewsAPI()
        hn.posts = samplePosts
        
        cv.hackerNews = hn
        
        return Group {
           cv
            .environment(\.colorScheme, .light)
              .previewDisplayName("Light Mode")

           cv
              .environment(\.colorScheme, .dark)
              .previewDisplayName("Dark Mode")
        }
    }
}
