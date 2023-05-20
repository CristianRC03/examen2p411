//
//  User.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class User: NSObject {
    @objc dynamic let id: Int
    @objc dynamic var nombre: String
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var email: String
    @objc dynamic var password: String
    @objc dynamic var birthdate: Date
    @objc dynamic var age: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthdate, to: Date())
        return components.year ?? 0
    }
    @objc dynamic var role: Int

    init(id: Int, nombre: String, firstName: String, lastName: String, email: String, password: String, birthdate: Date, role: Int) {
        self.id = id
        self.nombre = nombre
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.birthdate = birthdate
        self.role = role
    }
}
