//
//  Model.swift
//  peretz 2.0
//
//  Created by baga on 08.01.2021.
//

import Foundation
import Alamofire

struct Dish: Codable{
    var id: Int
    var name: String
    var description: String
    var price: Int
    var new: Bool
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case new
        case image
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        price = try container.decode(Int.self, forKey: .price)
        new = try container.decode(Bool.self, forKey: .new)
        image = try container.decode(String.self, forKey: .image)
    }
    
}






