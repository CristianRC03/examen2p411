//
//  ViewController.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var loginController = LoginController.compartir

    override func viewDidLoad() {
        super.viewDidLoad()
        let dateString = "18/6/2002"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        loginController.addUser(user: User(id: 1, name: "Admin", firstName: "Romero", lastName: "Crack", email: "admin@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 1))
    }


}

