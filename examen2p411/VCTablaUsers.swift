//
//  VCTablaUsers.swift
//  examen2p411
//
//  Created by Cristian Romero on 21/05/23.
//

import Cocoa

class VCTablaUsers: NSViewController {
    @objc dynamic var loginController = LoginController.compartir

    @IBOutlet weak var txtId: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
        let characterSet = NSCharacterSet.decimalDigits
        let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
        sender.stringValue = filteredText
    }
    
    @IBAction func btnActualizaClicked(_ sender: NSButton) {
        if (txtId.stringValue.isEmpty) {
            crearAlertaError("Ingresa un Id en el campo")
        } else {
            if (loginController.buscarUser(id: txtId.integerValue) != nil) {
                performSegue(withIdentifier: "irFormUserAct", sender: self)
            } else {
                crearAlertaError("Ingresa un Id valido")
            }
        }
    }
    
    @IBAction func btnEliminarClicked(_ sender: NSButton) {
        if (txtId.stringValue.isEmpty) {
            crearAlertaError("Ingresa un Id en el campo")
        } else {
            if (loginController.buscarUser(id: txtId.integerValue) != nil) {
                loginController.eliminarUser(id: txtId.integerValue)
                crearAlertaExito("USuario eliminado con exito")
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
        if segue.identifier == "irFormUserAct" {
            let destinationVC = segue.destinationController as! VCRegistro
            destinationVC.flag = false
            destinationVC.hidden = false
            destinationVC.idUserAct = txtId.integerValue
        }
    }
    
}
