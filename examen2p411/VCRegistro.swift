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
    var flag: Bool!
    var hidden: Bool!
    var idUserAct: Int?

    @IBOutlet weak var imgId: NSImageView!
    @IBOutlet weak var bgId: NSTextField!
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var txtConfirmarPassword: NSTextField!
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var dtpNacimiento: NSDatePicker!
    @IBOutlet weak var cmbxRol: NSComboBox!
    @IBOutlet weak var imgRol: NSImageView!
    @IBOutlet weak var bgRol: NSTextField!
    @IBOutlet weak var btnActualizar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cmbxRol.selectItem(at: 3)
        cmbxRol.isHidden = hidden
        bgRol.isHidden = hidden
        imgRol.isHidden = hidden
        txtId.isHidden = hidden
        bgId.isHidden = hidden
        imgId.isHidden = hidden
        btnActualizar.isHidden = flag
        btnCrear.isHidden = !flag
        userAActualizar()
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton) {
        if validarCamposLlenos() {
            let email: String? = txtEmail.stringValue
            if let text = email, text.range(of: emailRegex, options: .regularExpression) != nil {
                if txtPassword.stringValue == txtConfirmarPassword.stringValue {
                    if cmbxRol.indexOfSelectedItem == -1 {
                        crearAlertaError("No se ha seleccionado ningùn rol")
                    } else {
                        if (loginController.validarEmailRepetido(email: txtEmail.stringValue)) {
                            crearAlertaError("El correo ya existe, ingresa uno diferente")
                        } else {
                            var idUser: Int
                            if loginController.users.count == 0 {
                                idUser = 1
                            } else {
                                idUser = loginController.users.last!.id + 1
                            }
                            loginController.addUser(user: User(id: idUser, name: txtNombre.stringValue, firstName: txtApellidoP.stringValue, lastName: txtApellidoM.stringValue, email: txtEmail.stringValue, password: txtPassword.stringValue, birthdate: dtpNacimiento.dateValue, role: cmbxRol.indexOfSelectedItem + 1))
                            crearAlertaExito("Usuario agregado con exito")
                            dismiss(self)
                        }
                    }
                } else {
                    crearAlertaError("Revisa que las contraseña coincidan")
                }
            } else {
                crearAlertaError("El correo no coincide con el formatato de correo")
            }
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    @IBAction func btnActualizarClicked(_ sender: NSButton) {
        if validarCamposLlenos() {
            let email: String? = txtEmail.stringValue
            if let text = email, text.range(of: emailRegex, options: .regularExpression) != nil {
                if txtPassword.stringValue == txtConfirmarPassword.stringValue {
                    if cmbxRol.indexOfSelectedItem == -1 {
                        crearAlertaError("No se ha seleccionado ningùn rol")
                    } else {
                        if (loginController.validarEmailRepetido(email: txtEmail.stringValue)) {
                            crearAlertaError("El correo ya existe, ingresa uno diferente")
                        } else {
                            loginController.actualizarUser(userActualizar: User(id: txtId.integerValue, name: txtNombre.stringValue, firstName: txtApellidoP.stringValue, lastName: txtApellidoM.stringValue, email: txtEmail.stringValue, password: txtPassword.stringValue, birthdate: dtpNacimiento.dateValue, role: 1))
                            crearAlertaExito("Usuario actualizado con exito")
                            dismiss(self)
                        }
                    }
                } else {
                    crearAlertaError("Revisa que las contraseña coincidan")
                }
            } else {
                crearAlertaError("El correo no coincide con el formatato de correo")
            }
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
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
    
    func userAActualizar() {
        if idUserAct != nil {
            let userAct = loginController.buscarUser(id: idUserAct!)
            txtId.integerValue = userAct!.id
            dtpNacimiento.dateValue = userAct!.birthdate
            txtNombre.stringValue = userAct!.name
            txtApellidoP.stringValue = userAct!.firstName
            txtApellidoM.stringValue = userAct!.lastName
            txtEmail.stringValue = userAct!.email
            txtPassword.stringValue = userAct!.password
            txtConfirmarPassword.stringValue = userAct!.password
        }
    }
}
