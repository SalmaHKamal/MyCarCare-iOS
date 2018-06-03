//
//  CarWash.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class CarWash: Object {

    @objc dynamic var washingPlace = "";
    @objc dynamic var washingPrice = 0.0;
    @objc dynamic var washingDate = Date();
    
    convenience init (washingPlaceVal: String, washingPriceVal: Double, washingDateVal: Date) {
        
        self.init();
        self.washingPlace = washingPlaceVal;
        self.washingPrice = washingPriceVal;
        self.washingDate = washingDateVal;
    }
}
