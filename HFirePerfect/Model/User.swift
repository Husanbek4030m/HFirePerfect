//
//  User.swift
//  HFirePerfect
//
//  Created by Karavella on 19/09/22.
//

import Foundation

class User {
    var uid: String?
    var email: String?
    var displayName: String?
    
    init(uid: String? = nil, email: String? = nil, displayName: String? = nil) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
