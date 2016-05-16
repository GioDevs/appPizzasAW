//
//  GeneralVistaInterfaceController.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 15/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class GeneralVistaInterfaceController: WKInterfaceController {

    @IBOutlet var imagen: WKInterfaceImage!
    @IBOutlet var header: WKInterfaceLabel!
    @IBOutlet var grupoIngredientes: WKInterfaceGroup!
    @IBOutlet var buttonFinalizar: WKInterfaceButton!
    
    @IBOutlet var ingrediente1: WKInterfaceLabel!
    @IBOutlet var ingrediente2: WKInterfaceLabel!
    @IBOutlet var ingrediente3: WKInterfaceLabel!
    @IBOutlet var ingrediente4: WKInterfaceLabel!
    @IBOutlet var ingrediente5: WKInterfaceLabel!
    
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var ingredienteCount : Int = 1
        // Configure interface objects here.
        
        if let context = context as? String{
            header.setText(context)
            if (context == "Pequeña" || context == "Mediana" || context == "Grande"){
                header.setText("Tamaño \(context)")
                imagen.setImageNamed("pizza")
            }
            
            if (context == "Delgada" || context == "Crujiente" || context == "Gruesa"){
                header.setText("Masa \(context)")
                imagen.setImageNamed("masa")
            }
            
            if (context == "Mozarela" || context == "Cheddar" || context == "Parmesano" || context == "Sin queso"){
                header.setText("Queso \(context)")
                imagen.setImageNamed("queso")
            }
        }
        
        if let context2 = context as? ValoresContexto{
            header.setText("Ingredientes")
            
            for ingrediente in context2.ingredientes.values{
                print(ingredienteCount)
                print(ingrediente)
                
                if ingredienteCount == 1 {
                    ingrediente1.setText(ingrediente)
                }
                if ingredienteCount == 2 {
                    ingrediente2.setText(ingrediente)
                }
                if ingredienteCount == 3 {
                    ingrediente3.setText(ingrediente)
                }
                if ingredienteCount == 4 {
                    ingrediente4.setText(ingrediente)
                }
                if ingredienteCount == 5 {
                    ingrediente5.setText(ingrediente)
                }
                
                ingredienteCount += 1
            }
            grupoIngredientes.setHidden(false)
            imagen.setHidden(true)
            buttonFinalizar.setHidden(false)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func Finalizar() {
        
        
        
       let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
        
        self.presentAlertControllerWithTitle("Procesando pedido", message: "En un momento estara lista su orden", preferredStyle: WKAlertControllerStyle.Alert, actions: [aceptar])

        pushControllerWithName("tamanoPizza", context: valorContexto)
        
    }

}
