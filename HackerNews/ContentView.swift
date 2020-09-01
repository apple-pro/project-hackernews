//
//  ContentView.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/1/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List(posts) { post in
                Text("\(post.id) : \(post.title)")
            }
            .navigationBarTitle("Hacker News")
        }
    }
}

let posts = [
    Post(id: "1", title: "Test1"),
    Post(id: "2", title: "Test2")
]

struct Post: Identifiable {
    let id: String
    let title: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone Xs")
    }
}
