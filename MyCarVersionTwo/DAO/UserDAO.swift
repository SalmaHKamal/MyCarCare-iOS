//
//  UserDAO.swift
//  MyCarVersionTwo
//
//  Created by Yasmin Ahmed on 5/31/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import RealmSwift

class UserDAO: NSObject {

    private static let userInstance = UserDAO();
    private static let realm = try! Realm();
    
    override private init() {
        let folderPath = UserDAO.realm.configuration.fileURL!.deletingLastPathComponent().path;
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: "NSFileProtectionKey"): FileProtectionType.none],ofItemAtPath: folderPath);
    }
    
    class func getInstance() -> UserDAO {
        return UserDAO.userInstance;
    }
    
    func insertUser(userObj: User) {
        try! UserDAO.realm.write {
            UserDAO.realm.add(userObj);
        }
        print("User has been inserted into DB");
    }
    
}
