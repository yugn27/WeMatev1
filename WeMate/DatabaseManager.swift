//
//  DatabaseManager.swift
//  FirebaseTest
//
//  Created by Константин on 19.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Firebase

let BASE = Database.database().reference()

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private var _REF_BASE = BASE
    private var _REF_POSTS = BASE.child("posts")
    private var _REF_USERS = BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: [String: String]) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
