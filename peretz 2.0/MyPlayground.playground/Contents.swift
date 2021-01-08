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

var dishArray = [Dish]()

func getDishes(){
    AF.request("https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278").response { response in
        
        dishArray = try! JSONDecoder().decode([Dish].self, from: response.data!)

    }

}

getDishes()
