//
//  TripsView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 18.04.24.
//

import SwiftUI

struct TripsView: View {
    private enum CoordinateSpaces {
        case scrollView
    }
    var body: some View {
        ScrollView {
            ParallaxHeader(
                coordinateSpace: CoordinateSpaces.scrollView,
                defaultHeight: 400
            ) {
                Image("listing-1")
                    .resizable()
                    .scaledToFill()
            }
            Rectangle()
                .fill(.blue)
                .frame(height: 1000)
                .shadow(color: .black.opacity(0.8), radius: 10, y: -10)
                .offset(y: -10)
        }
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    TripsView()
}
