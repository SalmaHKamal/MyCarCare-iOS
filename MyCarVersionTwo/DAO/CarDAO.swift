//
//  CarDAO.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class CarDAO: NSObject {

    private static let carInstance = CarDAO();
    private static let realm = try! Realm();
    
    override private init() {
        let folderPath = CarDAO.realm.configuration.fileURL!.deletingLastPathComponent().path;
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: "NSFileProtectionKey"): FileProtectionType.none],ofItemAtPath: folderPath);
    }
    
    class func getInstance() -> CarDAO {
        return CarDAO.carInstance;
    }
    
    func insertCar(carObj: Car) {
        try! CarDAO.realm.write {
            CarDAO.realm.add(carObj);
        }
        print("Car has been inserted into DB");
    }
    
}
