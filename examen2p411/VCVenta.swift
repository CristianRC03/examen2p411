//
//  VCVenta.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCVenta: NSViewController {
    @objc dynamic var ventaController = VentaController.compartir
    @objc dynamic var loginController = LoginController.compartir
    @objc dynamic var productoController = ProductoController.compartir
    @objc dynamic var pedidoController = PedidoController.compartir
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtCantidad: NSTextField!
    @IBOutlet weak var txtSubtotal: NSTextField!
    @IBOutlet weak var txtInfoProducto: NSTextField!
    @IBOutlet weak var txtIVA: NSTextField!
    @IBOutlet weak var txtTotal: NSTextField!
    
    //ComboBox
    @IBOutlet weak var cmbCliente: NSComboBox!
    @IBOutlet weak var cmbProducto: NSComboBox!
    
    //Buttons
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let correos = loginController.usuariosCliente().map{ $0.email }
        cmbCliente.addItems(withObjectValues: correos)
        let nombres = productoController.productos.map{ $0.name }
        cmbProducto.addItems(withObjectValues: nombres)
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
        let characterSet = NSCharacterSet.decimalDigits
        let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
        sender.stringValue = filteredText
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton) {
        if (validarCamposLlenos()) {
            let venta = Venta(id: ventaController.ventas[ventaController.ventas.count - 1].id + 1, client: loginController.buscarEmailUser(email: cmbCliente.stringValue)!, product: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!, quantity: txtCantidad.integerValue, subtotal: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!.price * Double(txtCantidad.integerValue))
            ventaController.addVenta(venta: venta)
            pedidoController.addPedido(pedido: Pedido(id: pedidoController.pedidos[pedidoController.pedidos.count - 1].id + 1, product: venta.product, total: venta.total))
            crearAlertaExito("Verdad actuaizada con exito")
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    @IBAction func itemChanged(_ sender: NSComboBox) {
        let producto = productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!
        txtInfoProducto.stringValue = producto.descripcion
    }
    
    func validarCamposLlenos() -> Bool {
        if (cmbCliente.indexOfSelectedItem < 1 || cmbProducto.indexOfSelectedItem < 1 || txtInfoProducto.stringValue.isEmpty || txtCantidad.stringValue.isEmpty || txtCantidad.integerValue < 1 || txtSubtotal.stringValue.isEmpty || txtSubtotal.doubleValue < 1 || txtIVA.stringValue.isEmpty || txtIVA.doubleValue < 0.16 || txtTotal.stringValue.isEmpty || txtTotal.doubleValue < 1.16) {
            return false
        } else {
            return true
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
    
}
