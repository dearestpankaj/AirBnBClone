//
//  DeveloperPreview.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 13.04.24.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    private init() { }
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString, 
            houseType: House(
                id: 1, title: "Tiny Homes", image: "house"
            ),
            ownerUid: NSUUID().uuidString,
            ownerName: "Alexander Smith",
            ownerImageUrl: "male-prfile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 537,
            latitude: 52.498692,
            longitude: 13.296060, 
            imageUrls: ["listing-1", "listing-2", "listing-3", "listing-4"],
            address: "Friedrichstraße 43-45",
            city: "Berlin",
            state: "Brandenburg",
            title: "Checkpoint Villa",
            rating: 4.91,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            houseType: House(
                id: 1, title: "Tiny Homes", image: "house"
            ),
            ownerUid: NSUUID().uuidString,
            ownerName: "Kathrina Jones",
            ownerImageUrl: "male-prfile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 537,
            latitude: 47.367300,
            longitude: 8.539360,
            imageUrls: ["listing-3", "listing-1", "listing-4", "listing-2"],
            address: "Talstrasse 1",
            city: "Zurich",
            state: "8001",
            title: "Baur Au Lac Hotel",
            rating: 4.91,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            houseType: House(
                id: 6, title: "Mension", image: "house-mension"
            ),
            ownerUid: NSUUID().uuidString,
            ownerName: "Anna Vogt",
            ownerImageUrl: "male-prfile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 537,
            latitude: 47.348990,
            longitude: 8.598080,
            imageUrls: ["listing-3", "listing-2", "listing-4", "listing-1"],
            address: "Trichtenhauser Str. 20",
            city: "Zollikerberg",
            state: "8125",
            title: "Spital Zollikerberg",
            rating: 4.91,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            houseType: House(
                id: 6, title: "Mension", image: "house-mension"
            ),
            ownerUid: NSUUID().uuidString,
            ownerName: "Steve White",
            ownerImageUrl: "male-prfile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 537,
            latitude: 52.498692,
            longitude: 13.296060,
            imageUrls: ["listing-2", "listing-1", "listing-4", "listing-3"],
            address: "Friedrichstraße 43-45",
            city: "Berlin",
            state: "Brandenburg",
            title: "Bed & Camping Penn ar Pont",
            rating: 4.91,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            houseType: House(
                id: 2, title: "Apartments", image: "house-apartment"
            ),
            ownerUid: NSUUID().uuidString,
            ownerName: "Vedika Sachdeva",
            ownerImageUrl: "male-prfile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 537,
            latitude: 48.184580,
            longitude: -3.821580,
            imageUrls: ["listing-4", "listing-3", "listing-2", "listing-1"],
            address: "30 Rue de Morlaix",
            city: "Châteauneuf-du-Faou",
            state: "29520",
            title: "Chateauneuf du Faou",
            rating: 4.91,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
    
    var housings: [House] = [
        House(
            id: 1, title: "Tiny Homes", image: "house"
        ),
        House(
            id: 2, title: "Apartments", image: "house-apartment"
        ),
        House(
            id: 3, title: "Camping", image: "house-camping"
        ),
        House(
            id: 4, title: "Countryside", image: "house-countryside"
        ),
        House(
            id: 5, title: "Lake front", image: "house-lake-front"
        ),
        House(
            id: 6, title: "Mension", image: "house-mension"
        ),
        House(
            id: 7, title: "Skiing", image: "house-skiing"
        )
    ]
}
