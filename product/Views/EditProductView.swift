
// EditView.swift
//  product
//
//  Created by Imtious Bari on 19/9/23.
//
import SwiftUI
import Alamofire
import SwiftyJSON

struct EditProductView: View {
    @State private var newTitle = ""
    @State private var newPrice = ""
    
    let productId: Int
    
//    var productId: Int // Assuming you have a way to pass the product ID to this view
    
    var body: some View {
        VStack {
            TextField("New Title", text: $newTitle)
                .padding()
            
            TextField("New Price", text: $newPrice)
                .padding()
            
            Button(action: {
                print("Clicked")
                updateProduct(productId: productId, newTitle: newTitle) { result in
                    switch result {
                    case .success(let json):
                        if let data = try? JSONSerialization.data(withJSONObject: json, options: []) {
                            do {
                                let decodedProduct = try JSONDecoder().decode(Product.self, from: data)
                                print("Product edited successfully: \(decodedProduct)")
                            } catch {
                                print("Error decoding product: \(error)")
                            }
                        } else {
                            print("Error converting JSON to data")
                        }
                    case .failure(let error):
                        print("Error editing product: \(error)")
                    }
                }
            }) {
                Text("Save Changes")
            }


        }
        .padding()
    }
    
    func updateProduct(productId: Int, newTitle: String, completion: @escaping (Result<Any, AFError>) -> Void) {
        let url = "https://dummyjson.com/products/\(productId)"
        let parameters: [String: Any] = ["title": newTitle]
        
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    print("JSON Response: \(json)")
                    completion(.success(json))
                case .failure(let error):
                    print("Error editing product: \(error)")
                    completion(.failure(error))
                }
            }
    }


}
