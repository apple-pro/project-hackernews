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

let posts: [Post] = [
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone Xs")
    }
}
