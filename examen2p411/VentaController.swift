//
//  VentaController.swift
//  examen2p411
//
//  Created by Cristian Romero on 21/05/23.
//

import Cocoa

class VentaController: NSObject {
    @objc dynamic var ventas = [Venta]()
    @objc dynamic static var compartir: VentaController = {
        let instance = VentaController()
        return instance
    }()
    
    func addVenta(venta: Venta) {
        ventas.append(venta)
    }
    
    func actualizarVenta(ventaActualizada: Venta) {
        for i in 0..<ventas.count {
            if ventas[i].id == ventaActualizada.id {
                ventas[i] = ventaActualizada
                return
            }
        }
    }
    
    func eliminarVenta(id: Int) {
        var index: Int = -1
        for i in 0..<ventas.count {
            if(ventas[i].id == id) {
                index = i
            }
        }
        ventas.remove(at: index)
    }
    
    func buscarVenta(id: Int) -> Venta? {
        for venta in ventas {
            if venta.id == id{
                return venta
            }
        }
        return nil
    }
}
