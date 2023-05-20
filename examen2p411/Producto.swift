//
//  Producto.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class Producto: NSObject {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var descripcion: String
    @objc dynamic var unit: String
    @objc dynamic var price: Double
    @objc dynamic var cost: Double
    @objc dynamic var category: String
    
    init(id: Int, name: String, description: String, unit: String, price: Double, cost: Double, category: String) {
        self.id = id
        self.name = name
        self.descripcion = description
        self.unit = unit
        self.price = price
        self.cost = cost
        self.category = category
    }
}
