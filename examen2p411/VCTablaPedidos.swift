//
//  VCTablaPedidos.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCTablaPedidos: NSViewController {
    @objc dynamic var pedidosUsuario: [Pedido] = []
    
    @IBOutlet weak var bgImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
    }
    
}
