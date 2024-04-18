//
//  InboxView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 18.04.24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        VStack {
            GeometryReader() { proxy in
                Text("Hello, World!")
                    .frame(width: proxy.size.width * 0.9, height: 40)
                    .background(.red)
            }
            .background(.green)
            Text("More text")
                .background(.blue)
            Text("More text")
                .background(.pink)
            Text("More text")
                .background(.yellow)
        }
    }
}

#Preview {
    InboxView()
}
