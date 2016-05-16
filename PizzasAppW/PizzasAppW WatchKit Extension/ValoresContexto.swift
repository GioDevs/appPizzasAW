//
//  ValoresContexto.swift
//  PizzasAppW
//
//  Created by Giovanni Launizar Ortiz on 14/05/16.
//  Copyright © 2016 GioIOS. All rights reserved.
//

import WatchKit

class ValoresContexto: NSObject {
    var tamano:String=""
    var tipoMasa:String=""
    var tipoQueso:String=""
    var ingredientes = [String : String]()
    
    init(tamano:String, tipoMasa:String, tipoQueso:String, ingredientes:[String : String] ) {
        self.tamano = tamano
        self.tipoMasa = tipoMasa
        self.tipoQueso = tipoQueso
        self.ingredientes = ingredientes
    }
}