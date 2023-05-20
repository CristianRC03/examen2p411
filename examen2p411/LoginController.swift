//
//  LoginController.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class LoginController: NSObject {
    @objc dynamic var users = [User]()
    @objc dynamic static var compartir: LoginController = {
        let instance = LoginController()
        return instance
    }()
    
    func addUser(user: User){
        users.append(user)
        print(user.age)
    }
    
    func login(email:String, password:String) -> User? {
        for user in users {
            if user.email == email && user.password == password{
                return user
            }
        }
        return nil
    }
    
    func actualizarUser(userActualizar: User) {
        for i in 0..<users.count {
            if users[i].id == userActualizar.id {
                users[i] = userActualizar
                print("usuario actualizado con exito")
                return
            }
        }
    }
    
    func eliminarUser(id: Int) {
        var index: Int = -1
        for i in 0..<users.count {
            if(users[i].id == id) {
                index = i
            }
        }
        users.remove(at: index)
    }
    
    func buscarUser(id: Int) -> User? {
        for user in users {
            if user.id == id{
                return user
            }
        }
        return nil
    }
}
