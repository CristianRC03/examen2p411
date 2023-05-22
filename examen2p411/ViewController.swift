//
//  ViewController.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var loginController = LoginController.compartir
    @objc dynamic static var userGlobal: User?
    @objc dynamic var mensaje: String?

    @IBOutlet weak var txtCorreo: NSTextField!
    @IBOutlet weak var txtPassword: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateString = "18/6/2002"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        loginController.addUser(user: User(id: 1, name: "Admin", firstName: "Romero", lastName: "Crack", email: "admin@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 1))
    }
    
    func login() {
        let email = txtCorreo.stringValue
        let password = txtPassword.stringValue
                
        ViewController.userGlobal = loginController.login(email: email, password: password)
        
        if ViewController.userGlobal == nil {
            crearAlertaError("Usuario y/o contraseña \n incorrecto(s)")
        } else {
            mensaje = "Bienvenido " + ViewController.userGlobal!.email
            performSegue(withIdentifier: "irALogin", sender: self)
        }
    }
    
    @IBAction func loginClicked(_ sender: NSButton) {
        login()
    }

    func crearAlertaError(_ errorDescription: String) {
        let alert = NSAlert()
        alert.messageText = "Revisa los campos"
        alert.informativeText = errorDescription
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .warning
        alert.beginSheetModal(for: self.view.window!)
    }

}

