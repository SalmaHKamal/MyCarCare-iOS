//
//  CarWashDAO.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class CarWashDAO: NSObject {

    private static let  washingInstance = CarWashDAO();
    private static let realm = try! Realm();
    
    override private init() {
        let folderPath = CarWashDAO.realm.configuration.fileURL!.deletingLastPathComponent().path;
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: "NSFileProtectionKey"): FileProtectionType.none],ofItemAtPath: folderPath);
    }
    
    class func getInstance() -> CarWashDAO {
        return CarWashDAO.washingInstance;
    }
    
    func insertCarWashData(carWashObj: CarWash) {
        try! CarWashDAO.realm.write {
            CarWashDAO.realm.add(carWashObj);
        }
        print("new car wash has been inserted into DB");
    }
}
