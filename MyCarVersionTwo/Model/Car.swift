//
//  Car.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/25/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import Foundation

class Car{
    
    var carName : String 
    var carModel : String
    var carYear : String
    var carDescription : String
    var carImage : String
    
    init(name : String , model : String , year : String , desc : String , img: String) {
        carName = name
        carModel = model
        carYear = year
        carImage = img
        carDescription = desc
    }
    
}
