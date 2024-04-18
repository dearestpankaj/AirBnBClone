//
//  DestinationSearchView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 12.04.24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool
    @State private var selectedOptions: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocations.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocations = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOptions == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocations)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOptions == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOptions = .location }
            }
            
            //Date selection
            VStack(alignment: .leading) {
                if selectedOptions == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                // overrides tap gesture to fix ios 17.1 bug
                            })
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                // overrides tap gesture to fix ios 17.1 bug
                            })
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOptions == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOptions = .dates }
            }
            
            //num guests
            VStack(alignment: .leading) {
                if selectedOptions == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    }
                    onDecrement: { 
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    } 
                    .onTapGesture(count: 99, perform: {
                        // overrides tap gesture to fix ios 17.1 bug
                    })
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOptions == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOptions = .guests }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(false))
}

struct CollapsableDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: 10)
    }
}
