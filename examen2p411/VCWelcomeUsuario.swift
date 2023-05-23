//
//  VCWelcomeUsuario.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCWelcomeUsuario: NSViewController {

    //Labels
    @IBOutlet weak var lblUsuario: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var btnConsulta: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irFormUser" {
            let destinationVC = segue.destinationController as! VCRegistro
            destinationVC.flag = true
            destinationVC.hidden = false
        }
    }
    
}
