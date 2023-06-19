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
    var flag: Bool!
    var idVentAct: Int?
    
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
    @IBOutlet weak var bgImage: NSImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
        let correos = loginController.usuariosCliente().map{ $0.email }
        cmbCliente.addItems(withObjectValues: correos)
        let nombres = productoController.productos.map{ $0.name }
        cmbProducto.addItems(withObjectValues: nombres)
        btnCrear.isHidden = !flag
        btnModificar.isHidden = flag
        ventaAActualizar()
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
        let characterSet = NSCharacterSet.decimalDigits
        let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
        sender.stringValue = filteredText
        if cmbProducto.indexOfSelectedItem > -1 {
            txtSubtotal.doubleValue = productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!.price * sender.doubleValue
            txtIVA.doubleValue = txtSubtotal.doubleValue * 0.16
            txtTotal.doubleValue = txtSubtotal.doubleValue + txtIVA.doubleValue
        }
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton) {
        if (validarCamposLlenos()) {
            if (txtCantidad.integerValue > productoController.productos[cmbProducto.indexOfSelectedItem].exist) {
                crearAlertaError("No hay existencias para la compra")
            } else {
                var idVenta: Int
                var idPedido: Int
                if (ventaController.ventas.count == 0) {
                    idVenta = 1
                } else{
                    idVenta = ventaController.ventas.last!.id+1
                }
                if(pedidoController.pedidos.count == 0) {
                    idPedido = 1
                } else {
                    idPedido = ventaController.ventas.last!.id+1
                }
                let venta = Venta(id: idVenta, client: loginController.buscarEmailUser(email: cmbCliente.stringValue)!, product: productoController.productos[cmbProducto.indexOfSelectedItem], quantity: txtCantidad.integerValue, subtotal: productoController.productos[cmbProducto.indexOfSelectedItem].price * Double(txtCantidad.integerValue))
                venta.product.exist = productoController.productos[cmbProducto.indexOfSelectedItem].exist - txtCantidad.integerValue
                ventaController.addVenta(venta: venta)
                pedidoController.addPedido(pedido: Pedido(id: idPedido, product: venta.product, total: venta.total, client: venta.client))
                productoController.actualizarProducto(productoActualizado: venta.product)
                crearAlertaExito("Venta agregada con exito")
            }
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    @IBAction func btnActualizarClicked(_ sender: NSButton) {
        if (validarCamposLlenos()) {
            let ventaActualizada = Venta(id: txtId.integerValue, client: loginController.buscarEmailUser(email: cmbCliente.stringValue)!, product: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!, quantity: txtCantidad.integerValue, subtotal: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!.price * Double(txtCantidad.integerValue))
            ventaController.actualizarVenta(ventaActualizada: ventaActualizada)
            pedidoController.actualizarPedido(pedidoActualizado: Pedido(id: txtId.integerValue, product: ventaActualizada.product, total: ventaActualizada.total, client: ventaActualizada.client))
            crearAlertaExito("Venta actualizada con exito")
        } else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
        
    }
    
    @IBAction func itemChanged(_ sender: NSComboBox) {
        let producto = productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!
        txtInfoProducto.stringValue = producto.descripcion
    }
    
    func validarCamposLlenos() -> Bool {
        if (cmbCliente.indexOfSelectedItem < 0 || cmbProducto.indexOfSelectedItem < 0 || txtInfoProducto.stringValue.isEmpty || txtCantidad.stringValue.isEmpty || txtCantidad.integerValue < 0 || txtSubtotal.stringValue.isEmpty || txtSubtotal.doubleValue < 0 || txtIVA.stringValue.isEmpty || txtIVA.doubleValue < 0.16 || txtTotal.stringValue.isEmpty || txtTotal.doubleValue < 1.16) {
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
    
    func ventaAActualizar() {
        if idVentAct != nil {
            let ventaAct = ventaController.buscarVenta(id: idVentAct!)
            txtId.integerValue = ventaAct!.id
            cmbCliente.selectItem(at: cmbCliente.indexOfItem(withObjectValue: ventaAct!.client.email))
            cmbProducto.selectItem(at: cmbProducto.indexOfItem(withObjectValue: ventaAct!.product.name))
            txtInfoProducto.stringValue = ventaAct!.product.descripcion
            txtCantidad.integerValue = ventaAct!.quantity
            txtSubtotal.doubleValue = ventaAct!.subtotal
            txtIVA.doubleValue = ventaAct!.iva
            txtTotal.doubleValue = ventaAct!.total
        }
    }
    
}
