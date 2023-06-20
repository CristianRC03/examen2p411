//
//  VCWelcomeVendedor.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCWelcomeVendedor: NSViewController {
    
    //Labels
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var btnConsulta: NSButton!
    @IBOutlet weak var bgImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irFormVentAct" {
            let destinationVC = segue.destinationController as! VCVenta
            destinationVC.flag = true
        }
    }
    
}
