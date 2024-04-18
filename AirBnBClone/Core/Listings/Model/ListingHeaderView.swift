//
//  ListingHeaderView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 18.04.24.
//

import SwiftUI

struct ListingHeaderView: View {
    let listing: Listing
    let offset: Double
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ListingImageCarousalView(listing: listing)
                .frame(width: UIScreen.main.bounds.width, height: 400 + (offset > 0 ? offset : 0))
                .offset(y: (offset > 0 ? -offset : 0))
            Button {
//                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .padding(40)
            }
        }
    }
}

#Preview {
    ListingHeaderView(listing: DeveloperPreview.shared.listings[0], offset: 0)
}
