//
//  VCTablaProductos.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCTablaProductos: NSViewController {
    @objc dynamic var productoController = ProductoController.compartir
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    
    //Buttons
    @IBOutlet weak var btnBuscar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func btnActualizaClicked(_ sender: NSButton) {
        if (txtId.stringValue.isEmpty) {
            crearAlertaError("Ingresa un Id en el campo")
        } else {
            if (productoController.buscarProductos(id: txtId.integerValue) != nil) {
                performSegue(withIdentifier: "irProdAct", sender: self)
            } else {
                crearAlertaError("Ingresa un Id valido")
            }
        }
    }
    
    @IBAction func btnEliminarClicked(_ sender: NSButton) {
        if (txtId.stringValue.isEmpty) {
            crearAlertaError("Ingresa un Id en el campo")
        } else {
            if (productoController.buscarProductos(id: txtId.integerValue) != nil) {
                productoController.eliminarProducto(id: txtId.integerValue)
                crearAlertaExito("Producto eliminado con exito")
            } else {
                crearAlertaError("Ingresa un Id valido")
            }
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
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irProdAct" {
            let destinationVC = segue.destinationController as! vcProducto
            destinationVC.flag = false
            destinationVC.idProdAct = txtId.integerValue
        }
    }
    
}
