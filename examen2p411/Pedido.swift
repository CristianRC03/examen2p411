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
    @objc dynamic var client: User
    
    init(id: Int, product: Producto, total: Double, client: User) {
        self.id = id
        self.product = product
        self.total = total
        self.client = client
    }
}
