//
//  VCTablaVenta.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCTablaVenta: NSViewController {
    @objc dynamic var ventaController = VentaController.compartir
    
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
            if (ventaController.buscarVenta(id: txtId.integerValue) != nil) {
                performSegue(withIdentifier: "irVentAct", sender: self)
            } else {
                crearAlertaError("Ingresa un Id valido")
            }
        }
    }
    
    @IBAction func btnEliminarClicked(_ sender: NSButton) {
        if (txtId.stringValue.isEmpty) {
            crearAlertaError("Ingresa un Id en el campo")
        } else {
            if (ventaController.buscarVenta(id: txtId.integerValue) != nil) {
                ventaController.eliminarVenta(id: txtId.integerValue)
                crearAlertaExito("Venta eliminado con exito")
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
        if segue.identifier == "irVentAct" {
            let destinationVC = segue.destinationController as! VCVenta
            destinationVC.flag = false
            destinationVC.idVentAct = txtId.integerValue
        }
    }
    
}
