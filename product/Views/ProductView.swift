//
//  ProductView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//
import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        VStack{
            Text("Products")
                .font(.title)
                .foregroundColor(.white)
            NavigationView{
                List(viewModel.products, id: \.id) { product in NavigationLink(destination: ProductDetailView(product: product)){
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                case .empty, .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 60)
                                        .cornerRadius(10)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.system(size: 20))
                                Text(product.description)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack {
                            Text("Price: \(String(format: "$%.2f", product.price))")
                            Spacer()
                            Text("Discount: \(String(format: "%.2f%%", product.discountPercentage))")
                        }
                        
                        .padding(.leading, 5)
                    }
                    .padding(2)
                }
                .navigationBarTitle("Product List")
                    
                }
            }
            .onAppear {
                viewModel.fetchProducts {}
            }
            
        }
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}




