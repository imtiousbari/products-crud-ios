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
