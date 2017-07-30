//
//  coins.swift
//  JSON
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import Foundation

class Coin {
    var name: String
    var priceUSD: Double
    var priceBTC: Double
    var percent24h: Double
    
    init(name: String, priceUSD: Double, priceBTC: Double, percent24h: Double) {
        self.name = name
        self.priceUSD = priceUSD
        self.priceBTC = priceBTC
        self.percent24h = percent24h
    }
}
