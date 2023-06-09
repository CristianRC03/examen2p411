//
//  VCPedido.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class VCPedido: NSViewController {
    
    @objc dynamic var productoController =
    ProductoController.compartir
    
    @objc dynamic var pedidoController =
    PedidoController.compartir
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtTotal: NSTextField!
    @IBOutlet weak var txtInfoProducto: NSTextField!
    
    //ComboBox
    @IBOutlet weak var cmbProducto: NSComboBox!
    
    //Buttons
    @IBOutlet weak var btnCrear: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnEliminar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nombres = productoController.productos.map{$0.name}
        cmbProducto.addItems(withObjectValues: nombres)
    }
    
    func validarCamposLlenos() -> Bool {
        if txtId.stringValue.isEmpty || txtTotal.stringValue.isEmpty || txtInfoProducto.stringValue.isEmpty || cmbProducto.indexOfSelectedItem == -1 {
                return false
            }
            return true
    }
    
    
    @IBAction func btnActualizarClicked(_ sender: NSComboBox) {
        if validarCamposLlenos(){
            let dateString = "18/6/2002"
            let dateFormatter = DateFormatter()
            pedidoController.actualizarPedido(pedidoActualizado: Pedido(id: Int(txtId.stringValue)!, product: productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)!, total: txtTotal.doubleValue, client: User(id: 1, name: "", firstName: "", lastName: "", email: "", password: "", birthdate: dateFormatter.date(from: dateString)!, role: 4)))
            crearAlertaExito("Pedido actualizado con exito")
        }else{
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    @IBAction func itemChanged(_ sender: NSComboBox) {
        let producto = productoController.buscarProductos(id: cmbProducto.indexOfSelectedItem + 1)
        txtInfoProducto.stringValue = producto!.descripcion
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
