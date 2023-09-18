//
//  ProductDetailView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack {
                RemoteImage(url: product.thumbnail) 
                Text(product.title)
                    .font(.title)
                    .padding()
                
                Text("Description: \(product.description)")
                    .padding()
                
                Text("Price: $\(product.price)")
                    .padding()
                
                Text("Discount Percentage: \(product.discountPercentage)%")
                    .padding()
                
                Text("Rating: \(product.rating)")
                    .padding()
                
                Text("Stock: \(product.stock)")
                    .padding()
                
                Text("Brand: \(product.brand)")
                    .padding()
                
                Text("Category: \(product.category)")
                    .padding()
                
                // Display additional product details if needed

                // Add a button to navigate back if necessary
//                Button("Back to List") {
//                    // Implement navigation back to the list view here
//                }
                .padding()
            }
        }
//        .navigationBarTitle(product.title)
    }
}