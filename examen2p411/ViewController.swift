//
//  ViewController.swift
//  examen2p411
//
//  Created by Cristian Romero on 15/05/23.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var loginController = LoginController.compartir
    @objc dynamic var productoController = ProductoController.compartir
    @objc dynamic var compraController = CompraController.compartir
    @objc dynamic var ventaController = VentaController.compartir
    @objc dynamic var pedidoController = PedidoController.compartir
    @objc dynamic static var userGlobal: User?
    @objc dynamic var mensaje: String?
    @objc dynamic var flag: Bool = true

    @IBOutlet weak var txtCorreo: NSTextField!
    @IBOutlet weak var txtPassword: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateString = "18/6/2002"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        loginController.addUser(user: User(id: 1, name: "Admin", firstName: "Romero", lastName: "Crack", email: "admin@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 1))
        loginController.addUser(user: User(id: loginController.users.last!.id + 1, name: "Comprador", firstName: "Romero", lastName: "Crack", email: "comprador@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 2))
        loginController.addUser(user: User(id: loginController.users.last!.id + 1, name: "Vendedor", firstName: "Romero", lastName: "Crack", email: "vendedor@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 3))
        loginController.addUser(user: User(id: loginController.users.last!.id + 1, name: "Cliente", firstName: "Romero", lastName: "Crack", email: "cliente@hotmail.com", password: "12345678", birthdate: dateFormatter.date(from: dateString)!, role: 4))
        productoController.addProducto(producto: Producto(id: 1, name: "Minin takis", description: "Paquetes de mini takis de 25g", unit: "paquetes", price: 10, cost: 6, category: "Comida", exist: 8))
        compraController.addCompra(compra: Compra(id: 1, product: productoController.productos[0], quantity: 10, buyer: loginController.users[1]))
        ventaController.addVenta(venta: Venta(id: 1, client: loginController.users.last!, product: productoController.productos.first!, quantity: 2, subtotal: 10*2))
        pedidoController.addPedido(pedido: Pedido(id: 1, product: productoController.productos.first!, total: ventaController.ventas.first!.total, client: loginController.users.last!))
    }
    
    func login() {
        let email = txtCorreo.stringValue
        let password = txtPassword.stringValue
                
        ViewController.userGlobal = loginController.login(email: email, password: password)
        
        if ViewController.userGlobal == nil {
            crearAlertaError("Usuario y/o contraseña \n incorrecto(s)")
        } else {
            mensaje = "Bienvenido " + ViewController.userGlobal!.email
            enviarAMenu()
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
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "irRegistrar" {
            let destinationVC = segue.destinationController as! VCRegistro
            destinationVC.flag = flag
            destinationVC.hidden = true
        }
    }
    
    func enviarAMenu() {
        switch (ViewController.userGlobal!.role) {
            case 1:
                irVC("irAdmin")
                break
            case 2:
                irVC("irCompras")
                break
            case 3:
                irVC("irVentas")
                break
            case 4:
                irVC("irClientes")
                break
            default:
                print("Error")
                break
        }
    }
    
    func irVC(_ segue: String) {
        performSegue(withIdentifier: segue, sender: self)
    }

}

