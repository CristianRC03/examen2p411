//
//  VCWelcomeAdmin.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCWelcomeAdmin: NSViewController {
    
    //Labels
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //Buttons
    
    @IBOutlet weak var btnCliente: NSButton!
    @IBOutlet weak var btnUsuarios: NSButton!
    @IBOutlet weak var btnComprador: NSButton!
    @IBOutlet weak var btnVendedor: NSButton!
    @IBOutlet weak var bgImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
    }
    
}
