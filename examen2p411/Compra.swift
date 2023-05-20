//
//  Compra.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class Compra: NSObject {
    @objc dynamic var id: Int
    @objc dynamic var product: Producto
    @objc dynamic var quantity: Int
    @objc dynamic var buyer: User
    
    init(id: Int, product: Producto, quantity: Int, buyer: User) {
        self.id = id
        self.product = product
        self.quantity = quantity
        self.buyer = buyer
    }
    
}
