//
//  HouseTypeFilter.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 14.04.24.
//

import SwiftUI

struct HouseTypeFilter: View {
    let houses: [House]
    @Binding var selectedItem: House?
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(houses, id: \.self) { housing in
                        HStack(spacing: 8) {
                            VStack(spacing: 8) {
                                Image(housing.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 32, height: 32)
                                Text(housing.title)
                                    .font(.subheadline)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                            }
                            .frame(width: 80, height: 90)
                            .overlay( Divider()
                                .frame(maxWidth: (housing.id == selectedItem?.id) ? .infinity : 0, maxHeight:1)
                                       .background(Color.black), alignment: .bottom)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedItem = housing
                                }
                            }
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .frame(height: 80)
    }
}

#Preview {
    HouseTypeFilter(houses: DeveloperPreview.shared.housings, selectedItem: .constant(House(id: 2, title: "", image: "")))
}
