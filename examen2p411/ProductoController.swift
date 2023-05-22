//
//  ProductoController.swift
//  examen2p411
//
//  Created by Cristian Romero on 20/05/23.
//

import Cocoa

class ProductoController: NSObject {
    @objc dynamic var productos = [Producto]()
    @objc dynamic static var compartir: ProductoController = {
        let instance = ProductoController()
        return instance
    }()
    
    func addProducto(producto: Producto) {
        productos.append(producto)
    }
    
    func actualizarProducto(productoActualizado: Producto) {
        for i in 0..<productos.count {
            if productos[i].id == productoActualizado.id {
                productos[i] = productoActualizado
                return
            }
        }
    }
    
    func eliminarProducto(id: Int) {
        var index: Int = -1
        for i in 0..<productos.count {
            if(productos[i].id == id) {
                index = i
            }
        }
        productos.remove(at: index)
    }
    
    func buscarProductos(id: Int) -> Producto? {
        for producto in productos {
            if producto.id == id{
                return producto
            }
        }
        return nil
    }
}
