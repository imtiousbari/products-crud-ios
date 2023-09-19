//
//  ProductsView.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

import Foundation

import Alamofire
import SwiftyJSON

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    
    func fetchProducts(completion: @escaping () -> Void) {
        let url = "\(Api.products)"
        print("API URL: \(url)")
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let productsArray = json["products"].array {
                    self.products = productsArray.map { productJson in
                        return Product(
                            id: productJson["id"].intValue,
                            title: productJson["title"].stringValue,
                            description: productJson["description"].stringValue,
                            price: productJson["price"].doubleValue,
                            discountPercentage: productJson["discountPercentage"].doubleValue,
                            rating: productJson["rating"].doubleValue,
                            stock: productJson["stock"].intValue,
                            brand: productJson["brand"].stringValue,
                            category: productJson["category"].stringValue,
                            thumbnail: productJson["thumbnail"].stringValue,
                            images: productJson["images"].arrayValue.map { $0.stringValue }
                        )
                    }
                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    //    func addProduct(title: String, description: String, price: Double, discountPercentage: Double, rating: Double, stock: Int, brand: String, category: String, thumbnail: String, images: [String], completion: @escaping () -> Void) {
    //            let parameters: [String: Any] = [
    //                "title": title,
    //                "description": description,
    //                "price": price,
    //                "discountPercentage": discountPercentage,
    //                "rating": rating,
    //                "stock": stock,
    //                "brand": brand,
    //                "category": category,
    //                "thumbnail": thumbnail,
    //                "images": images
    //            ]
    //
    //            AF.request(Api.products, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
    //                switch response.result {
    //                case .success(_):
    //                    // Product added successfully, you can handle any further actions here
    //                    completion()
    //                case .failure(let error):
    //                    print(error)
    //                }
    //            }
    //        }
}
