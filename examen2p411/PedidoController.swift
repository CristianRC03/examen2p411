//
//  PedidoController.swift
//  examen2p411
//
//  Created by Cristian Romero on 21/05/23.
//

import Cocoa

class PedidoController: NSObject {
    @objc dynamic var pedidos = [Pedido]()
    @objc dynamic static var compartir: PedidoController = {
        let instance = PedidoController()
        return instance
    }()
    
    func addPedido(pedido: Pedido) {
        pedidos.append(pedido)
    }
    
    func actualizarPedido(pedidoActualizado: Pedido) {
        for i in 0..<pedidos.count {
            if pedidos[i].id == pedidoActualizado.id {
                pedidos[i] = pedidoActualizado
                return
            }
        }
    }
    
    func eliminarPedido(id: Int) {
        var index: Int = -1
        for i in 0..<pedidos.count {
            if(pedidos[i].id == id) {
                index = i
            }
        }
        pedidos.remove(at: index)
    }
    
    func buscarPedido(id: Int) -> Pedido? {
        for pedido in pedidos {
            if pedido.id == id{
                return pedido
            }
        }
        return nil
    }

}
