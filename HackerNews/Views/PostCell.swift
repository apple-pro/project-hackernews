//
//  PostCell.swift
//  HackerNews
//
//  Created by StartupBuilder.INFO on 9/1/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(post.title)
                    .font(.headline).fontWeight(.heavy)
                
                Text("by: \(post.author)")
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: post.url != nil ? "safari.fill": "nosign")
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(Color(.label))
            }.padding()
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: samplePosts[0])
            .previewLayout(.sizeThatFits)
    }
}
