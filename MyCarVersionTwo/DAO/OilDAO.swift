//
//  OilDAO.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class OilDAO: NSObject {

    private static let oilInstance = OilDAO();
    private static let realm = try! Realm();
    
    override private init() {
        let folderPath = OilDAO.realm.configuration.fileURL!.deletingLastPathComponent().path;
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: "NSFileProtectionKey"): FileProtectionType.none],ofItemAtPath: folderPath);
    }
    
    class func getInstance() -> OilDAO {
        return OilDAO.oilInstance;
    }
    
    func insertNewOil(oilObj: Oil) {
        try! OilDAO.realm.write {
            OilDAO.realm.add(oilObj);
        }
        print("new Oil has been inserted into DB");
    }
}
