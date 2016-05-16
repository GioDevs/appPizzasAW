//
//  IngredientesInterfaceController.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 14/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesInterfaceController: WKInterfaceController {

    @IBOutlet var jamon: WKInterfaceSwitch!
    @IBOutlet var peperoni: WKInterfaceSwitch!
    @IBOutlet var pavo: WKInterfaceSwitch!
    @IBOutlet var salchicha: WKInterfaceSwitch!
    @IBOutlet var aceituna: WKInterfaceSwitch!
    @IBOutlet var cebolla: WKInterfaceSwitch!
    @IBOutlet var pimiento: WKInterfaceSwitch!
    @IBOutlet var piña: WKInterfaceSwitch!
    @IBOutlet var anchoa: WKInterfaceSwitch!
    
    var valorContexto = ValoresContexto(tamano: "",tipoMasa: "",tipoQueso: "", ingredientes: ["":""])
    
    var ingredientes = [String : String]()
    var cantidadIngredientes : Int = 0
    
    var valores = [AnyObject]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        valorContexto = context as! ValoresContexto
        print(valorContexto.tamano)
        print(valorContexto.tipoMasa)
        print(valorContexto.tipoQueso)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func continuarConfirmacion() {
        valorContexto.ingredientes = self.ingredientes
        
        if self.ingredientes.count==0 {
            let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Ingredientes", message: "Debe seleccionar al menos un ingrediente", preferredStyle: WKAlertControllerStyle.Alert, actions: [aceptar])
        }
        
        valores.append(valorContexto.tamano)
        valores.append(valorContexto.tipoMasa)
        valores.append(valorContexto.tipoQueso)
        valores.append(valorContexto)
        
        let controllers = [String](count: 4, repeatedValue: "vistaFinal")
        presentControllerWithNames(controllers, contexts: valores)
        
        //pushControllerWithName("vistaConfirmacion", context: valorContexto)
    }
    
    func addValorIngrediente(llave:String, valor:String){
        ingredientes[llave] = valor
        cantidadIngredientes += 1
        print(ingredientes)
        enableSwitch(cantidadIngredientes)
    }
    func removeValorIngrediente(llave:String){
        ingredientes.removeValueForKey(llave)
        cantidadIngredientes -= 1
        print(ingredientes)
        enableSwitch(cantidadIngredientes)
    }
    
    func enableSwitch(seleccionados : Int){
        
        
        if seleccionados >= 5 {
            if (ingredientes["ja"] == nil){
                jamon.setEnabled(false)
            }
            if (ingredientes["pe"] == nil){
                peperoni.setEnabled(false)
            }
            if (ingredientes["pa"] == nil){
                pavo.setEnabled(false)
            }
            if (ingredientes["salc"] == nil){
                salchicha.setEnabled(false)
            }
            if (ingredientes["ac"] == nil){
                aceituna.setEnabled(false)
            }
            if (ingredientes["ceb"] == nil){
                cebolla.setEnabled(false)
            }
            if (ingredientes["pim"] == nil){
                pimiento.setEnabled(false)
            }
            if (ingredientes["pin"] == nil){
                piña.setEnabled(false)
            }
            if (ingredientes["anc"] == nil){
                anchoa.setEnabled(false)
            }
        }
        
        if(seleccionados < 5){
            jamon.setEnabled(true)
            peperoni.setEnabled(true)
            pavo.setEnabled(true)
            salchicha.setEnabled(true)
            aceituna.setEnabled(true)
            cebolla.setEnabled(true)
            pimiento.setEnabled(true)
            piña.setEnabled(true)
            anchoa.setEnabled(true)
            
        }
        
        
    }

    @IBAction func selectJamon(value: Bool) {
        if value{
            addValorIngrediente("ja", valor: "Jamon")
        }else{
            removeValorIngrediente("ja")
        }
        
    }
    @IBAction func selectPeperoni(value: Bool) {
        if value{
            addValorIngrediente("pe", valor: "Peperoni")
        }else{
            removeValorIngrediente("pe")
        }
    }
    @IBAction func selectPavo(value: Bool) {
        if value{
            addValorIngrediente("pa", valor: "Pavo")
        }else{
            removeValorIngrediente("pa")
        }
    }
    @IBAction func selectSalchichas(value: Bool) {
        if value{
            addValorIngrediente("salc", valor: "Salchica")
        }else{
            removeValorIngrediente("salc")
        }
    }
    @IBAction func selectAceituna(value: Bool) {
        if value{
            addValorIngrediente("ac", valor: "Aceituna")
        }else{
            removeValorIngrediente("ac")
        }
    }
    @IBAction func Cebolla(value: Bool) {
        if value{
            addValorIngrediente("ceb", valor: "Cebolla")
        }else{
            removeValorIngrediente("ceb")
        }
    }
    @IBAction func selectPimiento(value: Bool) {
        if value{
            addValorIngrediente("pim", valor: "Pimiento")
        }else{
            removeValorIngrediente("pim")
        }
    }
    @IBAction func selectPiña(value: Bool) {
        if value{
            addValorIngrediente("pin", valor: "Piña")
        }else{
            removeValorIngrediente("pin")
        }
    }
    @IBAction func selectAnchoa(value: Bool) {
        if value{
            addValorIngrediente("anc", valor: "Anchoa")
        }else{
            removeValorIngrediente("anc")
        }
    }
    
}
