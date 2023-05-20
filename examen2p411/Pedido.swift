//
//  Pedido.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class Pedido: NSObject {
    @objc dynamic var id: Int
    @objc dynamic var product: Producto
    @objc dynamic var total: Double
    
    init(id: Int, product: Producto, total: Double) {
        self.id = id
        self.product = product
        self.total = total
    }
}
