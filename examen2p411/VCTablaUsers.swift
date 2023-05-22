//
//  VCTablaUsers.swift
//  examen2p411
//
//  Created by Cristian Romero on 21/05/23.
//

import Cocoa

class VCTablaUsers: NSViewController {
    @objc dynamic var loginController = LoginController.compartir

    @IBOutlet weak var txtId: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textDidChange(_ sender: NSTextField) {
        let characterSet = NSCharacterSet.decimalDigits
        let filteredText = sender.stringValue.components(separatedBy: characterSet.inverted).joined()
        sender.stringValue = filteredText
    }
}
