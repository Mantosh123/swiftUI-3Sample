//
//  Order.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 27/09/24.
//

import Foundation

@Observable
class Order {
    
    static let types = ["Vanilla", "Strowberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnable = true
    var expraFrosting = false
    var addSprinkless = false
}
