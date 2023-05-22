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
    
    func addCompra(compra: Compra) {
        compras.append(compra)
    }
    
    func actualizarCompra(compraActualizada: Compra) {
        for i in 0..<compras.count {
            if compras[i].id == compraActualizada.id {
                compras[i] = compraActualizada
                return
            }
        }
    }
    
    func eliminarCompra(id: Int) {
        var index: Int = -1
        for i in 0..<compras.count {
            if(compras[i].id == id) {
                index = i
            }
        }
        compras.remove(at: index)
    }
    
    func buscarCompras(id: Int) -> Compra? {
        for compra in compras {
            if compra.id == id{
                return compra
            }
        }
        return nil
    }
}
