//
//  InterfaceController.swift
//  PizzasAppW WatchKit Extension
//
//  Created by Giovanni Launizar Ortiz on 14/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tamanoPizza: WKInterfaceLabel!
   
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func continuarMasa() {
        print(valorContexto.tamano)
        
        if valorContexto.tamano == "" {
            let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Tamaño de pizza", message: "Debe seleccionar un tamaño de pizza", preferredStyle: WKAlertControllerStyle.Alert, actions: [aceptar])
        }
        pushControllerWithName("vistaTiposMasa", context: valorContexto)
    }
    @IBAction func nuevoTamanoPizza(value: Float) {
        print (value)
        switch value {
        case 0:
            tamanoPizza.setText(" ")
            valorContexto.tamano = ""
        case 1:
            tamanoPizza.setText("Pequeña")
            valorContexto.tamano = "Pequeña"
        case 2:
            tamanoPizza.setText("Mediana")
            valorContexto.tamano = "Mediana"
        case 3:
            tamanoPizza.setText("Grande")
            valorContexto.tamano = "Grande"
        default:
            print(" ")
        }
        
    }
}
