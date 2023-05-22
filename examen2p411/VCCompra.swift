//
//  VCCompra.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCCompra: NSViewController {
    
    @objc dynamic var compraController = CompraController.compartir
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
    
    @IBAction func crearClicked(_ sender: NSButton) {
        if(validarCamposLlenos()) {
            compraController.addCompra(compra: Compra(id: compraController.compras[compraController.compras.count - 1].id + 1, product: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!, quantity: txtCantidad.integerValue, buyer: ViewController.userGlobal!))
            crearAlertaExito("Compra creada con exito")
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    @IBAction func btnActualizarClicked(_ sender: NSButton) {
        if(validarCamposLlenos()) {
            compraController.actualizarCompra(compraActualizada: Compra(id: txtId.integerValue, product: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!, quantity: txtCantidad.integerValue, buyer: ViewController.userGlobal!))
            crearAlertaExito("Compra actuaizada con exito")
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    func validarCamposLlenos() -> Bool {
        if (cmbProducto.indexOfSelectedItem == -1 || txtInfoProducto.stringValue.isEmpty || txtCantidad.stringValue.isEmpty || txtCantidad.integerValue < 1) {
            return false
        } else {
            return true
        }
    }
    
    func crearAlertaError(_ errorDescription: String) {
        let alert = NSAlert()
        alert.messageText = "Revisa los campos"
        alert.informativeText = errorDescription
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .warning
        alert.beginSheetModal(for: self.view.window!)
    }

    func crearAlertaExito (_ description: String) {
        let alert = NSAlert()
        alert.messageText = "Exito"
        alert.informativeText = description
        alert.icon = NSImage(named: "exito.gif")
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .warning
        alert.beginSheetModal(for: self.view.window!)
    }
}
