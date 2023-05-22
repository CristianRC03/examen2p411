//
//  VCCompra.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCCompra: NSViewController {
    
    @objc dynamic var productoController = ProductoController.compartir
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtCantidad: NSTextField!
    @IBOutlet weak var txtInfoProducto: NSTextField!
    
    //ComboBox
    @IBOutlet weak var cmbProducto: NSComboBox!
    
    //Buttons
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for producto in productoController.productos {
                    cmbProducto.addItem(withObjectValue: producto.name)
        }
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
            let characterSet = NSCharacterSet.decimalDigits
            let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
            sender.stringValue = filteredText
    }
    
}
