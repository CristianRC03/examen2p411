//
//  vcProducto.swift
//  examen2p411
//
//  Created by Diego Romero on 21/05/23.
//

import Cocoa

class vcProducto: NSViewController {
    @objc dynamic var productoController =
    ProductoController.compartir
    var flag: Bool!
    var idProdAct: Int?
    var exist: Int = 0
    
    //TextFields
    @IBOutlet weak var txtId: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtDescripcion: NSTextField!
    @IBOutlet weak var txtUnidad: NSTextField!
    @IBOutlet weak var txtPrecio: NSTextField!
    @IBOutlet weak var txtCosto: NSTextField!
    @IBOutlet weak var txtCategoria: NSTextField!
    
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
        btnCrear.isHidden = !flag
        btnModificar.isHidden = flag
        productoAActualizar()
    }
    
    @IBAction func btnCrearClicked(_ sender: NSButton){
        if validarCamposLlenos(){
            
            productoController.addProducto(producto: Producto(id: productoController.productos[productoController.productos.count-1].id + 1, name: txtNombre.stringValue, description: txtDescripcion.stringValue, unit: txtUnidad.stringValue, price: txtPrecio.doubleValue, cost: txtCosto.doubleValue, category: txtCategoria.stringValue, exist: 0))
            crearAlertaExito("Producto agregado con exito")
            dismiss(self)
        }else {
            crearAlertaError("Verifica que todos los campos esten llenos")
        }
    }
    
    
    @IBAction func btnModificarClicked(_ sender: NSButton) {
        if validarCamposLlenos(){
            productoController.actualizarProducto(productoActualizado: Producto(id: txtId.integerValue, name: txtNombre.stringValue, description: txtDescripcion.stringValue, unit: txtUnidad.stringValue, price: txtPrecio.doubleValue, cost: txtCosto.doubleValue, category: txtCategoria.stringValue, exist: exist))
                   crearAlertaExito("Producto modificado con exito")
            dismiss(self)
               }else {
                   crearAlertaError("Verifica que todos los campos esten llenos")
               }
    }
    
                                                   
                                                   
    
    func validarCamposLlenos() -> Bool {
        if ( txtNombre.stringValue.isEmpty || txtDescripcion.stringValue.isEmpty || txtUnidad.stringValue.isEmpty || txtPrecio.stringValue.isEmpty || txtCosto.stringValue.isEmpty || txtCategoria.stringValue.isEmpty) {
            return false
        }
        return true
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
    
    @IBAction func textDidChange(_ sender: NSTextField) {
            let characterSet = NSCharacterSet.decimalDigits
            let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
            sender.stringValue = filteredText
    }
    func productoAActualizar() {
        if idProdAct != nil {
            let prodAct = productoController.buscarProductos(id: idProdAct!)
            txtId.integerValue = prodAct!.id
            txtNombre.stringValue = prodAct!.name
            txtDescripcion.stringValue = prodAct!.descripcion
            txtUnidad.stringValue = prodAct!.unit
            txtPrecio.doubleValue = prodAct!.price
            txtCosto.doubleValue = prodAct!.cost
            txtCategoria.stringValue = prodAct!.category
            exist = prodAct!.exist
        }
    }
}
