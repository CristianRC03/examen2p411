//
//  VCRegistro.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class VCRegistro: NSViewController {
    @objc dynamic var loginController = LoginController.compartir

    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtTelefono: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var txtConfirmarPassword: NSTextField!
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var dtpNacimiento: NSDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton) {
        loginController.addUser(user: User(id: 1, firstName: "Romero", lastName: "Camacho", email: "cris@hotmail.com", password: "123456", birthdate: dtpNacimiento.dateValue, role: 1))
    }
    
}
