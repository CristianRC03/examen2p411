//
//  CompraController.swift
//  examen2p411
//
//  Created by Cristian Romero on 20/05/23.
//

import Cocoa

class CompraController: NSObject {
    @objc dynamic var compras = [Compra]()
    @objc dynamic static var compartir: CompraController = {
        let instance = CompraController()
        return instance
    }()
}
