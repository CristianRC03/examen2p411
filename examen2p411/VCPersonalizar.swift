//
//  VCPersonalizar.swift
//  examen2p411
//
//  Created by Cristian Romero on 19/06/23.
//

import Cocoa

class VCPersonalizar: NSViewController {
    @objc dynamic var colores: [String] = ["Morado", "Rosa", "Verde", "Gris", "Cafe"]
    @objc dynamic var imagenes: [String] = ["apple", "github", "linux", "swift", "xcode"]
    @objc dynamic static var image: String = "apple"
    @objc dynamic static var color: NSColor = NSColor.purple

    @IBOutlet weak var bgImage: NSImageView!
    @IBOutlet weak var cmbColores: NSComboBox!
    @IBOutlet weak var cmbImagenes: NSComboBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
        bgImage.image = NSImage(named: VCPersonalizar.image)
        cmbColores.addItems(withObjectValues: colores)
        cmbImagenes.addItems(withObjectValues: imagenes)
        cmbColores.selectItem(at: 0)
        cmbImagenes.selectItem(at: 0)
    }
    
    @IBAction func cmbChanged(_ sender: NSComboBox) {
        switch (cmbColores.stringValue) {
        case "Morado":
            VCPersonalizar.color = NSColor.purple
            break
        case "Rosa":
            VCPersonalizar.color = NSColor.systemPink
            break
        case "Verde":
            VCPersonalizar.color = NSColor.green
            break
        case "Gris":
            VCPersonalizar.color = NSColor.lightGray
            break
        case "Cafe":
            VCPersonalizar.color = NSColor.brown
            break
        default:
            VCPersonalizar.color = NSColor.white
            break
        }
        view.layer?.backgroundColor = VCPersonalizar.color.cgColor
    }
    
    @IBAction func cmbImageChanged(_ sender: NSComboBox) {
        VCPersonalizar.image = cmbImagenes.stringValue
        bgImage.image = NSImage(named: VCPersonalizar.image)
    }
    
}
