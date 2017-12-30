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

var artists = [Artist]()

@objc(ViewController)

class ViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var ArtistTableView: UITableView!
    var checkBoxSelected: Bool = false
    @IBOutlet var checkbox: UIButton!
    @IBOutlet weak var ComposerCheckbox: UIButton!
    @IBOutlet weak var SongWriterCheckbox: UIButton!
    @IBOutlet weak var MelodyCheckbox: UIButton!
    @IBOutlet weak var cellView: UIView!
    var ref:DatabaseReference! =  Database.database().reference()
    var song:Song?
    @IBOutlet weak var ArtistTableViewCell: UITableViewCell!
    @IBOutlet weak var SongTitleTextField : UITextField!
    @IBOutlet var ScrollView: UIScrollView!
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
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    let scrollViewContentWidth = UIScreen.main.bounds.width
    var songKey : String = ""
    var songRef : DatabaseReference!
    var cellCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.delegate = self
        //roleCheckBox()
        //ref = Database.database().reference()
        
        //self.updateDatabase()
        self.ArtistTableView.contentInset = UIEdgeInsetsMake(-566, 0, 0, 0);
        ArtistTableView.dataSource = self
        ArtistTableView.delegate = self
        //ScrollView.contentSize = CGSize(width: scrollViewContentWidth, height: scrollViewContentHeight)
        //ScrollView.delegate = self
        self.ArtistTableView.rowHeight = UITableViewAutomaticDimension
        let nibName = UINib(nibName: "ArtistTableViewCell", bundle: nil)
        self.ArtistTableView.register(nibName, forCellReuseIdentifier: "ArtistTableViewCell")
        self.ArtistTableView.isScrollEnabled = true
        
        updateDatabase()
        self.ArtistTableView.reloadData()
        //addArtist(self)
    }
    
    func viewWillAppear() {
        super.viewWillAppear(true)
        //roleCheckBox()
        self.viewWillAppear()
        updateDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let yOffset = ScrollView.contentOffset.y
//
//        if ScrollView == self.ScrollView {
//            if yOffset >= scrollViewContentHeight - screenHeight {
//                ScrollView.isScrollEnabled = false
//                ArtistTableView.isScrollEnabled = true
//            }
//        }
//
//        if scrollView == self.ArtistTableView {
//            if yOffset <= 0 {
//                self.ScrollView.isScrollEnabled = true
//                self.ArtistTableView.isScrollEnabled = false
//            }
//        }
//    }
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
    
    @IBAction func updateDatabase() {
        updateData()
        
        
            
        
        /*var legalName = artist.legalName
        var artistName = artist.artistName
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
        var eSignature = String(ESignatureTextField.text!)*/
        //var effectiveDate = Date(EffectiveDateTextField.text!)
//        currentArtist.phoneNumber = String(PhoneNumberTextField.text!)
        //song?.artists.append()
        
        
        //let currentArtist:Artist = Artist(legalName: legalName, artistName: artistName, labelName: labelName, phoneNumber: phoneNumber, email: email, address: address, role: "", publishingCompany: publishingCompany, publisherOwnershipPerentage: 0.0, performanceSociety: performanceSociety, IPISS: IPISS, musicOwnershipPercentage: 0.0, lyricsOwnershipPercentage: 0.0, agreedUponName: agreedUponName, eSignature: eSignature, dateEffective: Date())
        
        //song?.artists.append(currentArtist)
//        var sheetReference = ref?.child("songs").childByAutoId()// [[self.ref child:@"song"] child:uid]
//        var values = {"legalname": legalName, "phonenumber": truckPhoneNumber, "email": truckEmail, @"password": truckPassword, @"accounttype": vendorAccountType};
        
//        let key = ref.child("users").childByAutoId().key
//        let userID = key
//        let post = ["uid": userID,
//                    "songs": nil,
//                    "username": nil,
//                    "password": nil]
        //ArtistTableViewCell.AddArtist(self) as ArtistTableViewCell
        
        if songKey == "" {
            createSong()
        }
        
        if artists.isEmpty {
            var artistRef : DatabaseReference! = nil
            artistRef = songRef?.child("songartists").childByAutoId()
            
            
            let newArtist = Artist(legalName: "", artistName: "", labelName: "", phoneNumber: "", email: "", address: "", role: "", publishingCompany: "", publisherOwnershipPercentage: 0.0, performanceSociety: "", IPISS: "", musicOwnershipPercentage: 0.0, lyricsOwnershipPercentage: 0.0, agreedUponName: "", eSignature: "", dateEffective: Date())
            newArtist.ID = artistRef.key
            
            let artistpost = ["artistid": newArtist.ID,
                              "legalname": "",
                              "artistname": "",
                              "labelname": "",
                              "phonenumber": "",
                              "email": "",
                              "address": "",
                              "publishingco": "",
                              "publisherownershippercentage": 0.0,
                              "performacesociety": "",
                              "ipiss": "",
                              "musicownershippercentage": 0.0,
                              "lyricsownershippercentage": 0.0,
                              "agreeduponname": "",
                              "esignature": ""] as [String : Any]
            let artistData = ["/songartists/\(newArtist.ID)": artistpost]
            songRef.updateChildValues(artistData)
            song?.artists.append(newArtist)
            
            artists.append(newArtist)
            
            let cell = ArtistTableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell", for: IndexPath(row: 0, section: 0)) as! ArtistTableViewCell
            cell.ArtistIDLabel.text = newArtist.ID
            
            self.ArtistTableView.reloadData()
        } else {
            for artist in artists {
                var artistRef : DatabaseReference! = nil
                if artist.ID == "" {
                    artistRef = songRef?.child("songartists").childByAutoId()
                    artist.ID = artistRef.key
                    let cellID = ArtistTableView.visibleCells.count - 1
                    let cell = ArtistTableView.cellForRow(at: IndexPath(row: cellID, section: 0)) as! ArtistTableViewCell?
                    cell?.ArtistIDLabel.text = artist.ID
                    self.ArtistTableView.reloadData()
                }
                
                let artistpost = ["artistid": artist.ID,
                            "legalname": artist.legalName,
                            "artistname": artist.artistName,
                            "labelname": artist.labelName,
                            "phonenumber": artist.phoneNumber,
                            "email": artist.email,
                            "address": artist.address,
                            "publishingco": artist.publishingCompany,
                            "publisherownershippercentage": artist.publisherOwnershipPercentage,
                            "performacesociety": artist.performanceSociety,
                            "ipiss": artist.IPISS,
                            "musicownershippercentage": artist.musicOwnershipPercentage,
                            "lyricsownershippercentage": artist.lyricsOwnershipPercentage,
                            "agreeduponname": artist.agreedUponName,
                            "esignature": artist.eSignature] as [String : Any]
                let artistData = ["/songartists/\(artist.ID)": artistpost]
                songRef.updateChildValues(artistData)
                song?.artists.append(artist)
            }
        }
    }
    
    func createSong()
    {
        song?.title = SongTitleTextField.text!
        song?.artists = [Artist]()
        
        let songTitle = String(SongTitleTextField.text!)
        
        songRef = self.ref.child("songs").childByAutoId()
        songKey = songRef.key
        let post = ["songid": songKey,
                    "songtitle": songTitle]
        song?.id = String(describing: songRef)
        let songData = ["/songs/\(songKey)": post]
        self.ref.updateChildValues(songData)
    }
    /*@IBAction func addArtist() {
        
    }*/

    //the method returning size of the list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellID = "artist" + String(indexPath.row)
        let cell : ArtistTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
        cell.LegalNameTextField.delegate = self as? UITextFieldDelegate
        //cell.img.image = UIImage(named: imgs[indexPath.row])
        //cell.configure(text: "", placeholder: "Enter some text!")
        
        cell.isExpanded = self.expandedRows.contains(indexPath.row)

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if indexPath.row == 0 {
        
        let cellID = "artist" + String(indexPath.row)
        let cell = ArtistTableView.cellForRow(at: indexPath) as! ArtistTableViewCell?
        
        if (cell?.isExpanded)! || (expandedRows.count == 1 && artists.count == 1) {
            cell?.isExpanded = false
        } else {
            cell?.isExpanded = true
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        //}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //if indexPath.row == 0 {
        let cell = ArtistTableView.cellForRow(at: indexPath) as! ArtistTableViewCell?
        if (cell != nil) {
            if (cell?.isExpanded)! {
                expandedRows.insert(indexPath.row)
                return 530
            } else {
                expandedRows.remove(indexPath.row)
                return 35
            }
        } else if expandedRows.isEmpty && artists.count == 1 {
            expandedRows.insert(indexPath.row)
            return 530
        }
        
        return 35
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
        
        //cell.configure(text: "", placeholder: "Enter some text!")
        if cell.ArtistIDLabel.text == "" {
            updateDatabase()
        }
        return cell
    }
    
    func updateData()
    {
        let cells = self.ArtistTableView.visibleCells
    
        for cell in cells {
        // look at data
            let indexPath = ArtistTableView.indexPath(for: cell)
            let cell = ArtistTableView.cellForRow(at: indexPath!) as! ArtistTableViewCell!
            let role = ""
            let dateEffectiveDate = Date()
            let newArtist = Artist(legalName: "", artistName: "", labelName: "", phoneNumber: "", email: "", address: "", role: "", publishingCompany: "", publisherOwnershipPercentage: 0.0, performanceSociety: "", IPISS: "", musicOwnershipPercentage: 0.0, lyricsOwnershipPercentage: 0.0, agreedUponName: "", eSignature: "", dateEffective: Date())
            
            newArtist.legalName = cell!.LegalNameTextField.text!
            newArtist.artistName = cell!.ArtistNameTextField.text!
            newArtist.labelName = cell!.LabelNameTextField.text!
            newArtist.phoneNumber = cell!.PhoneNumberTextField.text!
            newArtist.email = cell!.EmailTextField.text!
            newArtist.address = cell!.AddressTextField.text!
            newArtist.publishingCompany = cell!.PublishingCompanyTextField.text!
            newArtist.publisherOwnershipPercentage = NSString(string: cell!.PublisherOwnershipPercentageTextField.text!).doubleValue
            newArtist.performanceSociety = cell!.PerformanceSocietyTextField.text!
            newArtist.IPISS = cell!.IPISSNumberTextField.text!
            newArtist.musicOwnershipPercentage = NSString(string: cell!.MusicOwnershipPercentageTextField.text!).doubleValue
            newArtist.lyricsOwnershipPercentage = NSString(string: cell!.LyricsOwnershipPercentageTextField.text!).doubleValue
            newArtist.agreedUponName = cell!.AgreedUponNameTextField.text!
            newArtist.eSignature = cell!.ESignatureTextField.text!
            newArtist.dateEffective = Date()
            
            //let newArtist:Artist = Artist.init(legalName: cell!.LegalNameTextField.text!, artistName: cell!.ArtistNameTextField.text!, labelName: cell!.LabelNameTextField.text!, phoneNumber: cell!.PhoneNumberTextField.text!, email: cell!.EmailTextField.text!, address: cell!.AddressTextField.text!, role: role, publishingCompany: cell!.PublishingCompanyTextField.text!, publisherOwnershipPercentage: Double((cell!.PublisherOwnershipPercentageTextField.text)!)!, performanceSociety: cell!.PerformanceSocietyTextField.text!, IPISS: cell!.IPISSNumberTextField.text!, musicOwnershipPercentage: Double((cell!.MusicOwnershipPercentageTextField.text)!)!, lyricsOwnershipPercentage: Double((cell!.LyricsOwnershipPercentageTextField.text)!)!, agreedUponName: cell!.AgreedUponNameTextField.text!, eSignature: cell!.ESignatureTextField.text!, dateEffective: dateEffectiveDate)
            
//            artist.legalName = (cell?.LegalNameTextField.text)!
//            artist?.artistName = (cell?.ArtistNameTextField.text)!
//            artist?.labelName = (cell?.LabelNameTextField.text)!
//            artist?.phoneNumber = (cell?.PhoneNumberTextField.text)!
//            artist?.email = (cell?.EmailTextField.text)!
//            artist?.address = (cell?.AddressTextField.text)!
//            //artist?.role = (cell?.role.text)!
//            artist?.publishingCompany = (cell?.PublishingCompanyTextField.text)!
//            artist?.publisherOwnershipPercentage = Double((cell?.PublisherOwnershipPercentageTextField.text)!)!
//            artist?.performanceSociety = (cell?.PerformanceSocietyTextField.text)!
//            artist?.IPISS = (cell?.IPISSNumberTextField.text)!
//            artist?.musicOwnershipPercentage = Double((cell?.MusicOwnershipPercentageTextField.text)!)!
//            artist?.lyricsOwnershipPercentage = Double((cell?.LyricsOwnershipPercentageTextField.text)!)!
//            artist?.agreedUponName = (cell?.AgreedUponNameTextField.text)!
//            artist?.eSignature = (cell?.ESignatureTextField.text)!
            //artist?.dateEffective = Date((cell?.EffectiveDateTextField.text)!)!
            
            artists.remove(at: (indexPath?.row)!)
            artists.insert(newArtist, at: (indexPath?.row)!)
            
        }
    }
    @IBAction func addArtist(_ sender: Any) {
       
        //let artistname =ArtistTableViewCell.ArtistNameTextField.text
        let newArtist = Artist(legalName: "", artistName: "", labelName: "", phoneNumber: "", email: "", address: "", role: "", publishingCompany: "", publisherOwnershipPercentage: 0.0, performanceSociety: "", IPISS: "", musicOwnershipPercentage: 0.0, lyricsOwnershipPercentage: 0.0, agreedUponName: "", eSignature: "", dateEffective: Date())
        
//        let initialCount = artists.count as Int
//        //let newObjects = linesmain[answertitle1] as! NSArray
//        
//        // appending the array to increase count
//        //someTagsArray += newObjects
        artists.append(newArtist)
        updateDatabase()
        
        ArtistTableView.reloadData()
//        
//        
//        self.ArtistTableView!.beginUpdates()
//        
//        var insertedIndexPaths: NSMutableArray = []
//        
//        //for var i = 0; i < newObjects.count; ++i {
//        insertedIndexPaths.add(NSIndexPath(row: artists.count, section: 0))
//        //}
//        //insertedIndexPaths.add(newArtist)
//        
//        
//        self.ArtistTableView?.insertRows(at: insertedIndexPaths as! [IndexPath], with: .fade)

    }
    /*@IBAction func save() {
        
    }*/
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: ArtistTableView.contentInset.top, left: 0, bottom: keyboardSize.height, right: 0)
            ArtistTableView.contentInset = contentInsets
            
            // If active text field is hidden by keyboard, scroll it so it's visible
            // Your app might not need or want this behavior.
            var aRect: CGRect = self.view.frame
            aRect.size.height -= keyboardSize.height
            let activeTextFieldRect: CGRect?
            let activeTextFieldOrigin: CGPoint?
            
            if ArtistTableViewCell as? ArtistTableViewCell != nil {
                //println("activeTextField not nil !")
                activeTextFieldRect = self.ArtistTableView?.superview?.superview?.frame
                activeTextFieldOrigin = activeTextFieldRect?.origin
                ArtistTableView.scrollRectToVisible(activeTextFieldRect!, animated:true)
            }
//            else if self.activeTextView != nil {
//                println("activeTextView not nil !")
//                activeTextFieldRect = self.activeTextView?.superview?.superview?.frame
//                activeTextFieldOrigin = activeTextFieldRect?.origin
//                self.tableView.scrollRectToVisible(activeTextFieldRect!, animated:true)
//            }
            
        }
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        var pointInTable:CGPoint = textView.superview!.convert(textView.frame.origin, to: ArtistTableView)
        var contentOffset:CGPoint = ArtistTableView.contentOffset
        contentOffset.y  = pointInTable.y
        if let accessoryView = textView.inputAccessoryView {
            contentOffset.y -= accessoryView.frame.size.height
        }
        ArtistTableView.contentOffset = contentOffset
        return true
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: ArtistTableView.contentInset.top, left: 0, bottom: 0, right: 0)
        ArtistTableView.contentInset = contentInsets
        //self.activeTextField = nil
        //self.activeTextView = nil
    }
}
