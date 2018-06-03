//
//  User.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {

    @objc dynamic var id = UUID().uuidString;
    @objc dynamic var name = "";
    @objc dynamic var email = "";
    @objc dynamic var password = "";
    @objc dynamic var gender = false;
    @objc dynamic var mobile = "";
    @objc dynamic var profilePic = "";
    var cars = List <Car>();
    var prevCarWashings = List <CarWash>();
    var prevRefuels = List <Refuel>();
    var prevOils = List <Oil>();
    
    override static func primaryKey() -> String? {
        return "id";
    }
    
    convenience init (userNameVal: String, userEmailVal: String, userPasswordVal: String, userGenderVal: Bool, userMobVal: String, userPicVal: String) {
        
        self.init();
        self.name = userNameVal;
        self.email = userEmailVal;
        self.password = userPasswordVal;
        self.gender = userGenderVal;
        self.mobile = userMobVal;
        self.profilePic = userPicVal;
    }
}
