//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 10.04.24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(viewModel: viewModel, show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocations)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    HouseTypeFilter(houses: DeveloperPreview.shared.housings, selectedItem: $viewModel.selectedHousing)
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 430)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        
                    }
                }
                .padding()
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
