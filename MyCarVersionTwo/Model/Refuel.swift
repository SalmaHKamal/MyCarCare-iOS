//
//  Refuel.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class Refuel: Object {

    @objc dynamic var type = Date();
    @objc dynamic var date = Date();
    @objc dynamic var price = 0.0;
    @objc dynamic var place = "";
    @objc dynamic var extraNotes = "";
    
    convenience init (refuelingTypeVal: Date, refuelingDateVal: Date, refuelingPriceVal: Double, refuelingPlaceVal: String, extraNotesVal: String) {
        
        self.init();
        self.type = refuelingTypeVal;
        self.date = refuelingDateVal;
        self.price = refuelingPriceVal;
        self.place = refuelingPlaceVal;
        self.extraNotes = extraNotesVal;
    }
}
