//
//  ExploreService.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 13.04.24.
//

import Foundation

struct ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        DeveloperPreview.shared.listings
    }
}
