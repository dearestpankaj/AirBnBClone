//
//  ListingDetailView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 11.04.24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    
    let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center:
                listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders], content: {
                
                GeometryReader { reader -> AnyView in
                    
                    let offset = reader.frame(in: .global).minY
                    return AnyView(
                        ListingHeaderView(listing: listing, offset: offset)
                    )
                }.frame(height: 400)
                
                Section {
                    propertyTitle
                    
                    Divider()
                    
                    hostInfo
                    
                    Divider()
                    
                    listingInfo
                    
                    Divider()
                    
                    bedInfo
                    
                    Divider()
                    
                    amenitiesView
                    
                    Divider()
                    
                    mapView
                }
                
            })
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            bottomPriceView
        }
    }
    
    var propertyTitle: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(listing.title)
                .font(.title)
                .fontWeight(.semibold)
            VStack(alignment: .leading) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                    Text(" - ")
                    Text("28 reviews")
                        .underline()
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                Text("\(listing.city), \(listing.state)")
            }
            .font(.caption)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var hostInfo: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                
                HStack(spacing: 2) {
                    Text("\(listing.numberOfGuests) guests -")
                    Text("\(listing.numberOfBedrooms) bedrooms -")
                    Text("\(listing.numberOfBeds) beds -")
                    Text("\(listing.numberOfBathrooms) baths -")
                }
                .font(.caption)
            }
            .frame(width: 300, alignment: .leading)
            
            Spacer()
            
            Image(listing.ownerImageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        }
        .padding()
    }
    
    var listingInfo: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(listing.features) { feature in
                HStack(spacing: 12) {
                    Image(systemName: feature.imageName)
                    
                    VStack(alignment: .leading) {
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text(feature.subTitle)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    var bedInfo: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16, content: {
                    ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                        VStack {
                            Image(systemName: "bed.double")
                            
                            Text("Bedroom \(bedroom)")
                        }
                        .frame(width: 132, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                })
            }
            .scrollTargetBehavior(.paging)
        }
        .padding()
    }
    
    var amenitiesView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)
            
            ForEach(listing.amenities) { amenity in
                HStack{
                    Image(systemName: amenity.imageName)
                        .frame(width: 32)
                    
                    Text(amenity.title)
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    var mapView: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text("Where you'll be")
                .font(.headline)
            
            Map(position: $cameraPosition)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        })
        .padding()
    }
    
    var bottomPriceView: some View {
        VStack {
            Divider()
                .padding(.bottom)
            HStack {
                VStack(alignment: .leading) {
                    Text("\(listing.pricePerNight)€")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Total before taxes")
                    
                    Text("Oct 15 - 20")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[3])
}
