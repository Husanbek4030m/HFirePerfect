//
//  DatabaseStore.swift
//  HFirePerfect
//
//  Created by Karavella on 04/01/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

class DatabaseStore : ObservableObject {
    var ref: DatabaseReference = Database.database().reference(withPath: "contacts")
    
    @Published var items: [Contacts] = []
    
    func storeContact(contact: Contacts, completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        let toBeContacted = ["firstName": contact.firstName, "lastName": contact.lastName, "phone": contact.phone]
        
        ref.childByAutoId().setValue(toBeContacted) {(error, ref) -> Void in
            if error != nil {
                success = false
            }
        }
        completion(success)
    }
    
    func loadContacts(completion: @escaping () -> ()) {
        ref.observe(DataEventType.value) { (snapshot) in
            self.items = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    let value = snapshot.value as? [String: AnyObject]
                    let firstName = value!["firstName"] as? String
                    let lastName = value!["lastName"] as? String
                    let phone = value!["phone"] as? String
                    
                    self.items.append(Contacts(firstName:firstName, lastName:lastName, phone:phone))
                }
            }
            completion()
            
        }
    }
}
