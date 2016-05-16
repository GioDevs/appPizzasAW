//
//  TipoMasaInterfaceController.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 14/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class TipoMasaInterfaceController: WKInterfaceController {

    @IBOutlet var pickerMasa: WKInterfacePicker!
    
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    var tiposMasa: [(String, String)] = [
        ("", ""),
        ("Delgada", "Delgada"),
        ("Crujiente", "Crujiente"),
        ("Gruesa", "Gruesa")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        valorContexto = context as! ValoresContexto
        print("valor......")
        print(valorContexto.tamano)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = tiposMasa.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        pickerMasa.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func continuarQueso() {
        print(valorContexto.tamano)
        print(valorContexto.tipoMasa)
        
        if valorContexto.tipoMasa == "" {
            let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Tipo de Masa", message: "Debe seleccionar un tipo de masa para continuar", preferredStyle: WKAlertControllerStyle.Alert, actions: [aceptar])
        }
        
        pushControllerWithName("vistaTipoQueso", context: valorContexto)
        

        
    }
    @IBAction func pickerChanged(value: Int) {
        print(tiposMasa[value].1)
        valorContexto.tipoMasa = tiposMasa[value].1
        
    }
}
