//
//  RefuelDAO.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class RefuelDAO: NSObject {

    private static let  refuelInstance = RefuelDAO();
    private static let realm = try! Realm();
    
    override private init() {
        let folderPath = RefuelDAO.realm.configuration.fileURL!.deletingLastPathComponent().path;
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: "NSFileProtectionKey"): FileProtectionType.none],ofItemAtPath: folderPath);
    }
    
    class func getInstance() -> RefuelDAO {
        return RefuelDAO.refuelInstance;
    }
    
    func insertRefuelData(refuelObj: Refuel) {
        try! RefuelDAO.realm.write {
            RefuelDAO.realm.add(refuelObj);
        }
        print("new refuel wash has been inserted into DB");
    }
}
