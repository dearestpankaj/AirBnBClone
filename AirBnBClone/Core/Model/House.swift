//
//  House.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 14.04.24.
//

import Foundation

struct House: Hashable, Identifiable, Codable {
    let id: Int
    let title: String
    let image: String
}
