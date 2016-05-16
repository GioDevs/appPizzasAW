//
//  TipoQuesoInterfaceController.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 14/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class TipoQuesoInterfaceController: WKInterfaceController {

    @IBOutlet var pickerQueso: WKInterfacePicker!
    
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    var tiposQueso: [(String, String)] = [
        ("", ""),
        ("Mozarela", "Mozarela"),
        ("Cheddar", "Cheddar"),
        ("Parmesano", "Parmesano"),
        ("Sin queso", "Sin queso")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        valorContexto = context as! ValoresContexto
        print(valorContexto.tamano)
        print(valorContexto.tipoMasa)
        

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = tiposQueso.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            //pickerItem.contentImage=WKImage(imageName: "porcin-de-queso.jpg")
            return pickerItem
        }
        pickerQueso.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func valueChanged(value: Int) {
        print(tiposQueso[value].1)
        valorContexto.tipoQueso = tiposQueso[value].1

    }

    @IBAction func continuarQueso() {
        print(valorContexto.tamano)
        print(valorContexto.tipoMasa)
        print(valorContexto.tipoQueso)
        
        if valorContexto.tipoQueso == "" {
            let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Tipo de queso", message: "Debe seleccionar un tipo de queso", preferredStyle: WKAlertControllerStyle.Alert, actions: [aceptar])
        }
        
        pushControllerWithName("vistaIngredientes", context: valorContexto)
    }
}
