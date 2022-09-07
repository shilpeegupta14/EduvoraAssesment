//
//  Order.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 07/09/22.
//

import Foundation


struct Order: Codable{
    let order_id: Int
    let product_id: Int
    let quantity: Int
    let user_id: Int
    let order_date: Int
}

