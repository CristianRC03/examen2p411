//
//  VCWelcomeComprador.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCWelcomeComprador: NSViewController {
    
    //Labels
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnAltaProducto: NSButton!
    @IBOutlet weak var btnAltaInventario: NSButton!
    @IBOutlet weak var btnConsultaInventario: NSButton!
    @IBOutlet weak var btnConsultaProducto: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irFormProdAct" {
            let destinationVC = segue.destinationController as! vcProducto
            destinationVC.flag = true
        } else {
            if segue.identifier == "irFormCompAct" {
                let destinationVC = segue.destinationController as! VCCompra
                destinationVC.flag = true
            }
        }
    }
    
}
