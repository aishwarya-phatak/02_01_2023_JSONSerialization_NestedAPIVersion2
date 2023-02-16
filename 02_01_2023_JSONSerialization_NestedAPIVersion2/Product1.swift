//
//  Product1.swift
//  02_01_2023_JSONSerialization_NestedAPIVersion2
//
//  Created by Vishal Jagtap on 16/02/23.
//

import Foundation
//model class for Products - https://jsonplaceholder.typicode.com/posts
struct Product1 : Decodable{
    var id : Int
    var title : String
    var price : Double
    var rate : Double
    var count : Int
    
    enum CodingKeys : CodingKey{
        case id
        case title
        case price
        case rating
    }
    
    enum RatingKeys : CodingKey{
        case rate
        case count
    }
    
    init(from decoder: Decoder) throws {
        let mainContainer = try! decoder.container(keyedBy: CodingKeys.self)
        id = try! mainContainer.decode(Int.self, forKey: .id)
        title = try! mainContainer.decode(String.self, forKey: .title)
        price = try! mainContainer.decode(Double.self, forKey: .price)
        
        let ratingsContainer = try! mainContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        rate = try! ratingsContainer.decode(Double.self, forKey: .rate)
        count = try! ratingsContainer.decode(Int.self, forKey: .count)
    }
}

//model class for Users - https://fakestoreapi.com/users
/*struct User : Decodable{
    var id : Int
    var username : String
    var email : String
    var city : String
    var number : Int
    var street : String
    var lat : Double
    var long : Double
    
    enum MainContainerKeys : CodingKey{
        case id, username, email, address
    }
    
    enum AddressKeys : CodingKey{
        case city
        case number
        case street
        case geolocation
    }
    
    enum GeolocationKeys : CodingKey{
        case lat, long
    }
}*/
