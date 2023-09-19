//
//  ProductDetailView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

import SwiftUI
import Alamofire

struct ProductDetailView: View {
    let product: Product
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newTitle = ""
    @State private var newPrice = ""
    
    
    //Delete Funtion>>
    func deleteProduct() {
        guard let productId = product.id else {
            print("Product ID is nil")
            return
        }
        
        let url = "https://dummyjson.com/products/\(productId)"
        
        AF.request(url, method: .delete)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Successfully deleted product: \(value)")
                    // Add logic to handle successful deletion here
                case .failure(let error):
                    print("Error deleting product: \(error)")
                }
            }
    }
//    Edit funtion
    func editProduct() {
        guard let productId = product.id else {
            print("Product ID is nil")
            return
        }
        
        let url = "https://dummyjson.com/products/\(productId)"
        let updatedData: [String: Any] = ["title": newTitle, "price": newPrice]
        
        AF.request(url, method: .put, parameters: updatedData, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Product edited successfully: \(value)")
                case .failure(let error):
                    print("Error editing product: \(error)")
                }
            }
    }

    

    





    var body: some View {
        ScrollView {
            //            HStack{
            //                VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Divider().background(Color.red) // Add a top border
                
                //                HStack {
                //                    Text("Action")
                //                        .bold()
                //                        .padding(.leading, 15)
                //                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        editProduct() // No need to pass arguments here
                        print("Clicked")
                    }) {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue)
                    }
                    


                    .padding()
                    
                    Button(action: {
                        // Add your delete action here
                        print("Product deleted succesfully")
                        deleteProduct()
                    }) {
                        Image(systemName: "trash.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                    }
                    
                }
                .padding(.trailing, 15)
            }
            
            VStack{
                RemoteImage(url: product.thumbnail)
                Text(product.title)
                    .font(.title)
                    .padding()
                
                
                //                    Text("Description: \(product.description)")
                Text(product.description)
                    .padding()
                
            }
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    //
                    HStack {
                        Text("Price: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(format: "$%.2f", product.price))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    HStack {
                        Text("Discount: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(format: "%.2f%%", product.discountPercentage))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    HStack {
                        Text("Rating: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(format: "%.2f", product.rating))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    HStack {
                        Text("Stock: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(product.stock))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    HStack {
                        Text("Brand: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(product.brand))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    HStack {
                        Text("Category: ")
                            .bold()
                            .padding(.leading, 15)
                        Spacer()
                        Text(String(product.category))
                        //                                .padding(.leading, 2)
                            .padding(.trailing, 15)
                    }
                    
                }
                Spacer()
                
                
            }
            
            
            
            
            
        }
        .navigationBarTitle(product.title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
        
    }
}


