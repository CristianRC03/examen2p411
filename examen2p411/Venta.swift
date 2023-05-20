//
//  Venta.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class Venta: NSObject {
    @objc dynamic var id: Int
    @objc dynamic var client: User
    @objc dynamic var product: Producto
    @objc dynamic var quantity: Int
    @objc dynamic var subtotal: Double
    @objc dynamic var iva: Double = 0.16
    @objc dynamic var total: Double
    
    init(id: Int, client: User, product: Producto, quantity: Int, subtotal: Double) {
        self.id = id
        self.client = client
        self.product = product
        self.quantity = quantity
        self.subtotal = subtotal
        self.iva = subtotal * self.iva
        self.total = subtotal + self.iva
    }
}
