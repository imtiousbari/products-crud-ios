//
//  AddProductView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

//import SwiftUI

//struct AddProductView: View {
//    @State private var title: String = ""
//    @State private var description: String = ""
//    @State private var price: String = ""
//    @State private var discountPercentage: String = ""
//    @State private var rating: String = ""
//    @State private var stock: String = ""
//    @State private var brand: String = ""
//    @State private var category: String = ""
//    @State private var thumbnail: String = ""
//    @State private var images: String = ""
//
//    @ObservedObject var viewModel = ProductAddViewModel()
////    @State private var showingProductDetail = false
//
//    var body: some View {
//        VStack {
//            Section {
//                TextField("Title", text: $title)
//                TextField("Description", text: $description)
//                TextField("Price", text: $price)
//                TextField("Discount Percentage", text: $discountPercentage)
//                TextField("Rating", text: $rating)
//                TextField("Stock", text: $stock)
//                TextField("Brand", text: $brand)
//                TextField("Category", text: $category)
//                TextField("Thumbnail", text: $thumbnail)
//                TextField("Images (comma separated)", text: $images)
//            }
//
//            Section {
//                Button(action: {
//                    if let priceValue = Double(price),
//                       let discountPercentageValue = Double(discountPercentage),
//                       let ratingValue = Double(rating),
//                       let stockValue = Int(stock) {
//                        let imagesArray = images.split(separator: ",").map { String($0) }
//                        let product = Product(
//                            title: title,
//                            description: description,
//                            price: priceValue,
//                            discountPercentage: discountPercentageValue,
//                            rating: ratingValue,
//                            stock: stockValue,
//                            brand: brand,
//                            category: category,
//                            thumbnail: thumbnail,
//                            images: imagesArray
//                        )
//                        viewModel.addProduct(
//                            title: product.title,
//                            description: product.description,
//                            price: product.price,
//                            discountPercentage: product.discountPercentage,
//                            rating: product.rating,
//                            stock: product.stock,
//                            brand: product.brand,
//                            category: product.category,
//                            thumbnail: product.thumbnail,
//                            images: product.images
//                        )
//                    }
//                }) {
//                    Text("Add Product")
//                }
//            }
//        }
//        .padding()
//    }
//}



import SwiftUI

struct AddProductView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    @State private var discountPercentage: String = ""
    @State private var rating: String = ""
    @State private var stock: String = ""
    @State private var brand: String = ""
    @State private var category: String = ""
    @State private var thumbnail: String = ""
    @State private var images: String = ""

    @ObservedObject var viewModel = ProductAddViewModel()

    @State private var showingProductDetail = false

    var body: some View {
        VStack {
            // ... (your existing code)
            Section {
                         TextField("Title", text: $title)
                         TextField("Description", text: $description)
                         TextField("Price", text: $price)
                         TextField("Discount Percentage", text: $discountPercentage)
                         TextField("Rating", text: $rating)
                         TextField("Stock", text: $stock)
                         TextField("Brand", text: $brand)
                         TextField("Category", text: $category)
                         TextField("Thumbnail", text: $thumbnail)
                         TextField("Images (comma separated)", text: $images)
                     }

            Section {
                Button(action: {
                    if let priceValue = Double(price),
                       let discountPercentageValue = Double(discountPercentage),
                       let ratingValue = Double(rating),
                       let stockValue = Int(stock) {
                        let imagesArray = images.split(separator: ",").map { String($0) }

                        viewModel.addProduct(
                            title: title,
                            description: description,
                            price: priceValue,
                            discountPercentage: discountPercentageValue,
                            rating: ratingValue,
                            stock: stockValue,
                            brand: brand,
                            category: category,
                            thumbnail: thumbnail,
                            images: imagesArray
                        )

                        showingProductDetail = true
                    }
                }) {
                    Text("Add Product")
                }
                .sheet(isPresented: $showingProductDetail) {
                    if let addedProduct = viewModel.addedProduct {
                        ProductDetailView(product: addedProduct)
                    } else {
                        Text("Product Detail View")
                    }
                }
            }
        }
        .padding()
    }
}
