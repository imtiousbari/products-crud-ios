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
        AF.request(Api.products).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
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
}
