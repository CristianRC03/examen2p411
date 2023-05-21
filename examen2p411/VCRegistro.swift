//
//  VCRegistro.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class VCRegistro: NSViewController {
    @objc dynamic var loginController = LoginController.compartir
    var emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var txtConfirmarPassword: NSTextField!
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var dtpNacimiento: NSDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton) {
        if validarCamposLlenos() {
            let email: String? = txtEmail.stringValue
            if let text = email, text.range(of: emailRegex, options: .regularExpression) != nil {
                if txtPassword.stringValue == txtConfirmarPassword.stringValue {
                    loginController.addUser(user: User(id: loginController.users.count + 1, name: txtNombre.stringValue, firstName: txtApellidoP.stringValue, lastName: txtApellidoM.stringValue, email: txtEmail.stringValue, password: txtPassword.stringValue, birthdate: dtpNacimiento.dateValue, role: 1))
                } else {
                    crearAlerta("Revisa que las contraseña coincidan")
                }
            } else {
                crearAlerta("El correo no coincide con el formatato de correo")
            }
        } else {
            crearAlerta("Verifica que todos los campos esten llenos")
        }
        
        
        
    }
    
    func validarCamposLlenos() -> Bool {
        if ( txtNombre.stringValue.isEmpty || txtApellidoP.stringValue.isEmpty || txtApellidoM.stringValue.isEmpty || txtEmail.stringValue.isEmpty || txtPassword.stringValue.isEmpty || txtConfirmarPassword.stringValue.isEmpty) {
            return false
        }
        return true
    }
    
    @IBAction func txtDidChange(_ sender: NSTextField) {
        let text = sender.stringValue
        let filteredText = text.components(separatedBy: CharacterSet.decimalDigits)
        sender.stringValue = filteredText.joined()
    }
    
    func crearAlerta(_ errorDescription: String) {
        let alert = NSAlert()
        alert.messageText = "Revisa los campos"
        alert.informativeText = errorDescription
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .warning
        alert.beginSheetModal(for: self.view.window!)
    }
}
