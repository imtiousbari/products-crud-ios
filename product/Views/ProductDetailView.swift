//
//  ProductDetailView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

//import SwiftUI
//
//struct ProductDetailView: View {
//    let product: Product
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                RemoteImage(url: product.thumbnail)
//                Text(product.title)
//                    .font(.title)
//                    .padding()
//
//                Text("Description: \(product.description)")
//                    .padding()
//
//                Text("Price: $\(product.price)")
//                    .padding()
//
//                Text("Discount Percentage: \(product.discountPercentage)%")
//                    .padding()
//
//                Text("Rating: \(product.rating)")
//                    .padding()
//
//                Text("Stock: \(product.stock)")
//                    .padding()
//
//                Text("Brand: \(product.brand)")
//                    .padding()
//
//                Text("Category: \(product.category)")
//                    .padding()
//
//                // Display additional product details if needed
//
//                // Add a button to navigate back if necessary
////                Button("Back to List") {
////                    // Implement navigation back to the list view here
////                }
//                .padding()
//            }
//        }
////        .navigationBarTitle(product.title)
//    }
//}
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                RemoteImage(url: product.thumbnail)
                Text(product.title)
                    .font(.title)
                    .padding()
                
                Text("Description: \(product.description)")
                    .padding()
                
                Text("Price: \(String(format: "$%.2f", product.price))")
                    .padding()
                
                Text("Discount: \(String(format: "%.2f%%", product.discountPercentage))")
                    .padding()
                
                Text("Rating: \(String(format: "%.2f", product.rating))")
                    .padding()
                
                Text("Stock: \(product.stock)")
                    .padding()
                
                Text("Brand: \(product.brand)")
                    .padding()
                
                Text("Category: \(product.category)")
                    .padding()
                
                // Display additional product details if needed
            }
        }
        .navigationBarTitle(product.title)
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss() // Dismiss this view
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
    }
}
