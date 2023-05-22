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
    
}
