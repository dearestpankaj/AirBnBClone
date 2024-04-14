//
//  ListingImageCarousalView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 11.04.24.
//

import SwiftUI

struct ListingImageCarousalView: View {
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarousalView(listing: DeveloperPreview.shared.listings[0])
}
