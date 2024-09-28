//
//  Order.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 27/09/24.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnable = "specialRequestEnable"
        case _expraFrosting = "expraFrosting"
        case _addSprinkless = "addSprinkless"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
        
    }
    static let types = ["Vanilla", "Strowberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnable = true
    var expraFrosting = false
    var addSprinkless = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Decimal {
        
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        cost = Decimal(type) / 2
        
        if expraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkless {
            cost += Decimal(quantity)/2
        }
        
        return cost
        
    }
    
}
