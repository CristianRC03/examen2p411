//
//  VCVenta.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCVenta: NSViewController {
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtCantidad: NSTextField!
    @IBOutlet weak var txtSubtotal: NSTextField!
    @IBOutlet weak var txtInfoProducto: NSTextField!
    @IBOutlet weak var txtIVA: NSTextField!
    @IBOutlet weak var txtTotal: NSTextField!
    
    //ComboBox
    @IBOutlet weak var cmbCliente: NSComboBox!
    @IBOutlet weak var cmbProducto: NSComboBox!
    
    //Buttons
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
            let characterSet = NSCharacterSet.decimalDigits
            let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
            sender.stringValue = filteredText
        }
    
}
