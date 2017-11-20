//
//  Artist.swift
//  Split Sheetz
//
//  Created by Verve on 11/19/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit

class Artist: NSObject {
    var legalName: String = ""
    var artistName: String = ""
    var labelName: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var address: String = ""
    var role: String = "" //create type
    var publishingCompany: String = ""
    var publishingOwnershipPerentage: Double = 0
    var performanceSociety: String = "" //create type
    var IPISS: String = ""
    var musicOwnershipPercentage: Double = 0
    var lyricsOwnershipPercentage: Double = 0
    var agreedUponName: String = ""
    var agreedUponSignature: String = "" //change type
    var dateEffective: Date = Date()
    
    init (legalName: String, artistName: String, labelName: String, phoneNumber: String, email: String, address: String, role: String, publishingCompany: String, publishingOwnershipPerentage: Double, performanceSociety: String, IPISS: String, musicOwnershipPercentage: Double, lyricsOwnershipPercentage: Double, agreedUponName: String, agreedUponSignature: String, dateEffective: Date) {
        self.legalName = legalName
        self.artistName = artistName
        self.labelName = labelName
        self.phoneNumber = phoneNumber
        self.email = email
        self.address = address
        self.role = role
        self.publishingCompany = publishingCompany
        self.publishingOwnershipPerentage = publishingOwnershipPerentage
        self.performanceSociety = performanceSociety
        self.IPISS = IPISS
        self.musicOwnershipPercentage = musicOwnershipPercentage
        self.lyricsOwnershipPercentage = lyricsOwnershipPercentage
        self.agreedUponName = agreedUponName
        self.agreedUponSignature = agreedUponSignature
        self.dateEffective = dateEffective
    }
}


