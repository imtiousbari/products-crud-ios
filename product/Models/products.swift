//
//  products.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

import Foundation

struct Product {
    var id: Int? 
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
