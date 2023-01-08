//
//  ContactCell.swift
//  HFirePerfect
//
//  Created by Karavella on 08/01/23.
//

import SwiftUI

struct ContactCell: View {
    var contact: Contacts
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(contact.firstName!.uppercased()).fontWeight(.bold).foregroundColor(.red)
                Text(contact.lastName!.uppercased()).fontWeight(.bold).foregroundColor(.red)
            }
            Text(contact.phone!.uppercased()).fontWeight(.bold)
        }
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contacts(firstName: "Husan", lastName: "Mannonov", phone: "+998977990022"))
    }
}
