//
//  Product.swift
//  02_01_2023_JSONSerialization_NestedAPIVersion2
//
//  Created by Vishal Jagtap on 15/02/23.
//

import Foundation
//way 2 - creating a different structure for nested API
struct Product{
    var id : Int
    var title : String
    var price : Double
    var rating : Rating
}

struct Rating{
    var rate : Double
    var count : Int
}

// API - "https://fakestoreapi.com/carts"
//struct APIResponse{
//    var id : Int
//    var userId : Int
//    var product : [Product1]
//}
//
//struct Product1{
//    var productId : Int
//    var quantity : Int
//}
