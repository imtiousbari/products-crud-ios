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
            
            ScrollView{
                Section {
                    Text("Add new product")
                        .font(.title2)
                    VStack(alignment: .leading, spacing: 8) {
//                        TextFieldWithLabel(label: "Title", text: $title, placeholder: "Enter title")(different placeholder)
                        TextFieldWithLabel(label: "Title", text: $title)
                        TextFieldWithLabel(label: "Description", text: $description)
                        TextFieldWithLabel(label: "Price", text: $price)
                        TextFieldWithLabel(label: "Discount Percentage", text: $discountPercentage)
                        TextFieldWithLabel(label: "Rating", text: $rating)
                        TextFieldWithLabel(label: "Stock", text: $stock)
                        TextFieldWithLabel(label: "Brand", text: $brand)
                        TextFieldWithLabel(label: "Category", text: $category)
                        TextFieldWithLabel(label: "Thumbnail", text: $thumbnail)
                        TextFieldWithLabel(label: "Images (comma separated)", text: $images)
                    }
                }
                
            }
//            padding()
            
            Section {
                Button(action: {
                    if let priceValue = Double(price),
                       let discountPercentageValue = Double(discountPercentage),
                       let ratingValue = Double(rating),
                       let stockValue = Int(stock) {
                        let imagesArray = images.split(separator: ",").map { String($0) }
                        //                        print("discountPercentage: \(discountPercentage)")
                        
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
                        .foregroundColor(.white)
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.blue)
                               .cornerRadius(8)
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


//Section {
//    VStack(alignment: .leading, spacing: 8) {
//        HStack {
//            Text("Title")
//            Spacer()
//        }
//        .padding(.horizontal)
//
//        TextField("Title", text: $title)
//            .padding(.horizontal)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//        HStack {
//            Text("Description")
//            Spacer()
//        }
//        .padding(.horizontal)
//
//        TextField("Description", text: $description)
//            .padding(.horizontal)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//        // Repeat the pattern for other fields...
//    }
//    .padding(.vertical)
//}
struct TextFieldWithLabel: View {
    let label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField("Enter \(label)", text: $text)
//            TextField(placeholder, text: $text) // Set the placeholder text here(different placeholder)
//                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}
