//
//  VCWelcomeCliente.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCWelcomeCliente: NSViewController {
    @objc dynamic var pedidoController = PedidoController.compartir
    
    //Labels
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnConsulta: NSButton!
    @IBOutlet weak var btnActualizar: NSButton!
    @IBOutlet weak var bgImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let destinationvc = segue.destinationController as! VCTablaPedidos
        if segue.identifier == "irPediTabla" {
            if ViewController.userGlobal!.role == 1 {
                destinationvc.pedidosUsuario = pedidoController.pedidos
            } else {
                destinationvc.pedidosUsuario = pedidoController.pedidosDeCliente(client: ViewController.userGlobal!)
            }
        }
    }
    
}
