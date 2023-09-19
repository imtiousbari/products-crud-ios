//
//  ProductAddViewModel.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//

//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class ProductAddViewModel: ObservableObject {
//    func addProduct(
//        title: String,
//        description: String,
//        price: Double,
//        discountPercentage: Double,
//        rating: Double,
//        stock: Int,
//        brand: String,
//        category: String,
//        thumbnail: String,
//        images: [String]
//    ) {
//        let url = "\(Api.products)/add" // Using the provided baseUrl and adding the endpoint for adding a product
//        let headers: HTTPHeaders = ["Content-Type": "application/json"]
//
//        let parameters: [String: Any] = [
//            "title": title,
//            "description": description,
//            "price": price,
//            "discountPercentage": discountPercentage,
//            "rating": rating,
//            "stock": stock,
//            "brand": brand,
//            "category": category,
//            "thumbnail": thumbnail,
//            "images": images
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
//                    print(json)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//}


import Foundation
import Alamofire
import SwiftyJSON

class ProductAddViewModel: ObservableObject {
    @Published var addedProduct: Product?

    func addProduct(
        title: String,
        description: String,
        price: Double,
        discountPercentage: Double,
        rating: Double,
        stock: Int,
        brand: String,
        category: String,
        thumbnail: String,
        images: [String]
    ) {
        let url = "\(Api.products)/add"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let parameters: [String: Any] = [
            "title": title,
            "description": description,
            "price": price,
            "discountPercentage": discountPercentage,
            "rating": rating,
            "stock": stock,
            "brand": brand,
            "category": category,
            "thumbnail": thumbnail,
            "images": images
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { [weak self] response in
                guard let self = self else { return }
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if let id = json["id"].int {
                        let product = Product(
                            id: id,
                            title: json["title"].stringValue,
                            description: json["description"].stringValue,
                            price: json["price"].doubleValue,
                            discountPercentage: json["discountPercentage"].doubleValue,
                            rating: json["rating"].doubleValue,
                            stock: json["stock"].intValue,
                            brand: json["brand"].stringValue,
                            category: json["category"].stringValue,
                            thumbnail: json["thumbnail"].stringValue,
                            images: json["images"].arrayValue.map { $0.stringValue }
                        )
                        self.addedProduct = product
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
