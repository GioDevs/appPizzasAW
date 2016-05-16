//
//  InicialInterfaceController.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 15/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class InicialInterfaceController: WKInterfaceController {

    @IBOutlet var logoInicial: WKInterfaceImage!
    
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        logoInicial.setImageNamed("pizz_logo")
        sleep(2)
        pushControllerWithName("tamanoPizza", context: valorContexto)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        sleep(2)
        pushControllerWithName("tamanoPizza", context: valorContexto)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func conitnuar() {
        pushControllerWithName("tamanoPizza", context: valorContexto)
    }
}
