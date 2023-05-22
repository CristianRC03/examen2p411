//
//  VCTablaPedidos.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCTablaPedidos: NSViewController {
    @objc dynamic var pedidoController = PedidoController.compartir
    
    //TextFields
    @IBOutlet weak var txtBuscar: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnBuscar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
