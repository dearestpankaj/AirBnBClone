//
//  ExploreViewModel.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 13.04.24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocations = ""
    @Published var selectedHousing: House? {
        didSet {
            print(selectedHousing)
            filterListingsWithHousings()
        }
    }
    
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func filterListingsWithHousings() {
        if let selectedHousing {
            let filteredListings = listings.filter { $0.houseType?.id == selectedHousing.id }
            listings = filteredListings.isEmpty ? listingsCopy : filteredListings
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocations.lowercased() ||
            $0.state.lowercased() == searchLocations.lowercased()
        })
        listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
