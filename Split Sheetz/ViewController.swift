//
//  ViewController.swift
//  Split Sheetz
//
//  Created by Verve on 11/19/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabaseUI

@objc(ViewController)

class ViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ArtistTableView: UITableView!
    var checkBoxSelected: Bool = false
    @IBOutlet var checkbox: UIButton!
    @IBOutlet weak var ComposerCheckbox: UIButton!
    @IBOutlet weak var SongWriterCheckbox: UIButton!
    @IBOutlet weak var MelodyCheckbox: UIButton!
    @IBOutlet weak var cellView: UIView!
    var ref:DatabaseReference! =  Database.database().reference()
    var song:Song?
    var artists = [Artist]()
    @IBOutlet weak var ArtistTableViewCell: UITableViewCell!
    @IBOutlet weak var sttf: UITextField!
    @IBOutlet weak var SongTitleTextField : UITextField!
    @IBOutlet weak var sf: UITextField!
    //    @IBOutlet weak var LegalNameTextField: UITextField!
//    @IBOutlet weak var ArtistNameTextField: UITextField!
//    @IBOutlet weak var LabelNameTextField: UITextField!
//    @IBOutlet weak var PhoneNumberTextField: UITextField!
//    @IBOutlet weak var EmailTextField: UITextField!
//    @IBOutlet weak var AddressTextField: UITextField!
//    @IBOutlet weak var ComposerRoldCheckBox: UIButton!
//    @IBOutlet weak var SongWriterRoleCheckBox: UIButton!
//    @IBOutlet weak var MelodyRoleCheckBox: UIButton!
//    @IBOutlet weak var PublishingCompanyTextField: UITextField!
//    @IBOutlet weak var PublisherOwnershipPercentageTextField: UITextField!
//    @IBOutlet weak var PerformanceSocietyTextField: UITextField!
//    @IBOutlet weak var IPISSNumberTextField: UITextField!
//    @IBOutlet weak var MusicOwnershipPercentageTextField: UITextField!
//    @IBOutlet weak var LyricsOwnershipPercentageTextField: UITextField!
//    @IBOutlet weak var AgreedUponNameTextField: UITextField!
//    @IBOutlet weak var ESignatureTextField: UITextField!
//    @IBOutlet weak var EffectiveDateTextField: UITextField!
//
    //song?.artists = [Artist]()
    //@IBOutlet var view: UIView!
    
    private var cellExpanded: Bool = false
    var expandedRows = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.delegate = self
        //roleCheckBox()
        //ref = Database.database().reference()
        
        //self.createOrUpdateSheet()
        
        ArtistTableView.dataSource = self
        ArtistTableView.delegate = self
        
        self.ArtistTableView.rowHeight = UITableViewAutomaticDimension
        
        let nibName = UINib(nibName: "ArtistTableViewCell", bundle: nil)
        ArtistTableView.register(nibName, forCellReuseIdentifier: "ArtistTableViewCell")
    }
    
    func viewDidAppear() {
        //super.viewDidAppear()
        //roleCheckBox()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*func roleCheckBox() {
        
        let image = UIImage(named: "notselectedcheckbox.png") as UIImage!
        //checkbox.frame = CGRect(x:100, y:120, width:20, height:20)
        
        ComposerCheckbox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage!, for: .normal)
        ComposerCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        ComposerCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        ComposerCheckbox.adjustsImageWhenHighlighted = true
        ComposerCheckbox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        SongWriterCheckbox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        SongWriterCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        SongWriterCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        SongWriterCheckbox.adjustsImageWhenHighlighted = true
        SongWriterCheckbox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        MelodyCheckbox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        MelodyCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        MelodyCheckbox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        MelodyCheckbox.adjustsImageWhenHighlighted = true
        MelodyCheckbox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        //self.view.addSubview(checkbox)
    }

    @IBAction func checkboxSelected(_ sender: UIButton)
    {
        checkBoxSelected = !checkBoxSelected; /* Toggle */
        sender.isSelected = checkBoxSelected
    }*/
    
    /*@IBAction func createOrUpdateSheet() {
        song?.title = SongTitleTextField.text!
        song?.artists = [Artist]()
        
        var songTitle = String(SongTitleTextField.text!)
        var legalName = String(LegalNameTextField.text!)
        var artistName = String(ArtistNameTextField.text!)
        var labelName = String(LabelNameTextField.text!)
        var phoneNumber = String(PhoneNumberTextField.text!)
        var email = String(EmailTextField.text!)
        var address = String(AddressTextField.text!)
        var publishingCompany = String(PublishingCompanyTextField.text!)
        let publisherOwnershipPercentage = Double(PublisherOwnershipPercentageTextField.text!)
        var performanceSociety = String(PerformanceSocietyTextField.text!)
        var IPISS = String(IPISSNumberTextField.text!)
        var musicOwnershipPercentage = String(MusicOwnershipPercentageTextField.text!)
        var lyricsOwnershipPercentage = String(LyricsOwnershipPercentageTextField.text!)
        var agreedUponName = String(AgreedUponNameTextField.text!)
        var eSignature = String(ESignatureTextField.text!)
        //var effectiveDate = Date(EffectiveDateTextField.text!)
//        currentArtist.phoneNumber = String(PhoneNumberTextField.text!)
        //song?.artists.append()
        
        let currentArtist:Artist = Artist(legalName: legalName, artistName: artistName, labelName: labelName, phoneNumber: phoneNumber, email: email, address: address, role: "", publishingCompany: publishingCompany, publishingOwnershipPerentage: 0.0, performanceSociety: performanceSociety, IPISS: IPISS, musicOwnershipPercentage: 0.0, lyricsOwnershipPercentage: 0.0, agreedUponName: agreedUponName, eSignature: eSignature, dateEffective: Date())
        
        song?.artists.append(currentArtist)
//        var sheetReference = ref?.child("songs").childByAutoId()// [[self.ref child:@"song"] child:uid]
//        var values = {"legalname": legalName, "phonenumber": truckPhoneNumber, "email": truckEmail, @"password": truckPassword, @"accounttype": vendorAccountType};
        
//        let key = ref.child("users").childByAutoId().key
//        let userID = key
//        let post = ["uid": userID,
//                    "songs": nil,
//                    "username": nil,
//                    "password": nil]
        let songRef = self.ref.child("songs").childByAutoId()
        let songKey = songRef.key
        let post = ["songid": songKey,
                    "songtitle": songTitle] 
        
        let songData = ["/songs/\(songKey)": post]
        self.ref.updateChildValues(songData)
        
        let artistRef = songRef.child("songartists").childByAutoId()
        let artistKey = artistRef.key
        let artistpost = ["artistid": artistKey,
                    "legalname": legalName,
                    "artistname": artistName,
                    "labelname": labelName,
                    "phonenumber": phoneNumber,
                    "email": email,
                    "address": address,
                    "publishingco": publishingCompany,
                    "publisherownershippercentage": publisherOwnershipPercentage,
                    "performacesociety": performanceSociety,
                    "ipiss": IPISS,
                    "musicownershippercentage": musicOwnershipPercentage,
                    "lyricsownershippercentage": lyricsOwnershipPercentage,
                    "agreeduponname": agreedUponName,
                    "esignature": eSignature] as [String : Any]
        let artistData = ["/songs/\(songKey)/songartists/\(artistKey)": artistpost]
        self.ref.updateChildValues(artistData)
    }
    
    @IBAction func addArtist() {
        
    }*/
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell", for: indexPath) as! ArtistTableViewCell
//
//        //let theme = themes[indexPath.row]
//
//        //cell.myLabel.text = theme.themeN=7[- ame
//        //cell.myImageView.image = UIImage(named: "test.png")
//
//        //println("The loaded image: \(cell.myImageView.image)")
//
//        return cell;
//    }

    //the method returning size of the list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artists.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell : ArtistTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell

        //cell.img.image = UIImage(named: imgs[indexPath.row])

        cell.isExpanded = self.expandedRows.contains(indexPath.row)

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if cellExpanded {
                cellExpanded = false
            } else {
                cellExpanded = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if cellExpanded {
                return 530
            } else {
                return 45
            }
        }
        return 45
    }
    /*@IBAction func save() {
        
    }*/
}
