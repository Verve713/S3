//
//  User.swift
//  Split Sheetz
//
//  Created by Verve on 11/23/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit

class User: NSObject {

    var uid: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var userName: String = ""
    var password: String = ""
    var email: String = ""
    var birthDate: Date = Date()
    var photo: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    var songs: [Song] = [Song]()
    
    init(uid: String, firstName: String, lastName: String, userName: String, password: String, email: String, birthDate: Date, photo: String, phoneNumber: String, address: String){
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.password = password
        self.email = email
        self.birthDate = birthDate
        self.photo = photo
        self.phoneNumber = phoneNumber
        self.address = address
    }

}

