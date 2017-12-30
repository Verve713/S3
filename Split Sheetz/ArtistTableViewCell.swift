//
//  ArtistTableViewCell.swift
//  Split Sheetz
//
//  Created by Verve on 12/4/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

  
    @IBOutlet var ShowDetailsButton: UIButton!
    @IBOutlet var ArtistIDLabel: UILabel!
    @IBOutlet weak var LegalNameTextField: UITextField!
    @IBOutlet weak var ArtistNameTextField: UITextField!
    @IBOutlet weak var LabelNameTextField: UITextField!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet var ComposerRoleCheckBox: UIButton?
    @IBOutlet var SongWriterRoleCheckBox: UIButton?
    @IBOutlet var MelodyRoleCheckBox: UIButton?
    @IBOutlet weak var PublishingCompanyTextField: UITextField!
    @IBOutlet weak var PublisherOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var PerformanceSocietyTextField: UITextField!
    @IBOutlet weak var IPISSNumberTextField: UITextField!
    @IBOutlet weak var MusicOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var LyricsOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var AgreedUponNameTextField: UITextField!
    @IBOutlet weak var ESignatureTextField: UITextField!
    @IBOutlet weak var EffectiveDateTextField: UITextField!
    private var cellExpanded: Bool = false
    let vc = ViewController()
    
    func AddArtist(_ sender: Any) {
        var role:String
        if ComposerRoleCheckBox?.currentImage == UIImage(named: "selectedcheckbox.png") {
            role = "Composer"
        } else if SongWriterRoleCheckBox?.currentImage == UIImage(named: "selectedcheckbox.png") {
            role = "Song Writer"
        } else if MelodyRoleCheckBox?.currentImage == UIImage(named: "selectedcheckbox.png") {
            role = "Melody"
        } else {
            role = ""
        }
        let doublePublisherOwnershipPercentage = Double(PublishingCompanyTextField.text!)
        let doubleMusicOwnershipPercentage = Double(MusicOwnershipPercentageTextField.text!)
        let doubleLyricsOwnershipPercentage = Double(LyricsOwnershipPercentageTextField.text!)
        let dateEffectiveDate = Date()
        let newArtist:Artist = Artist.init(legalName: LegalNameTextField.text!, artistName: ArtistNameTextField.text!, labelName: LabelNameTextField.text!, phoneNumber: PhoneNumberTextField.text!, email: EmailTextField.text!, address: AddressTextField.text!, role: role, publishingCompany: PublishingCompanyTextField.text!, publisherOwnershipPercentage: doublePublisherOwnershipPercentage!, performanceSociety: PerformanceSocietyTextField.text!, IPISS: IPISSNumberTextField.text!, musicOwnershipPercentage: doubleMusicOwnershipPercentage!, lyricsOwnershipPercentage: doubleLyricsOwnershipPercentage!, agreedUponName: AgreedUponNameTextField.text!, eSignature: ESignatureTextField.text!, dateEffective: dateEffectiveDate)
        
        artists.append(newArtist)
    }
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint?
    
    var checkBoxSelected: Bool = false
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded || (vc.expandedRows.isEmpty && artists.count == 1) {
                self.cellHeightConstraint?.constant = 35.0
                
            } else {
                self.cellHeightConstraint?.constant = 530.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //let v = ViewController.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        //self.navigationController?.pushViewController(v!, animated: true)
        initRoleCheckBoxes()
        //NSObject.accessibilityElement(at: self)
        //accessibilityElements
        
        //LegalNameTextField.delegate = self
    }
    
    func initRoleCheckBoxes() {
        
        let image = UIImage(named: "notselectedcheckbox.png") as UIImage!
        //checkbox.frame = CGRect(x:100, y:120, width:20, height:20)
        //let ComposerRoleCheckBox = UIAlertAction(title: "ComposerRole", style: .default, handler: nil)
        
        ComposerRoleCheckBox?.setTitle("ComposerRole", for: .normal)
        ComposerRoleCheckBox?.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage!, for: .normal)
        ComposerRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        ComposerRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        ComposerRoleCheckBox?.adjustsImageWhenHighlighted = true
        ComposerRoleCheckBox?.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        SongWriterRoleCheckBox?.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        SongWriterRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        SongWriterRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        SongWriterRoleCheckBox?.adjustsImageWhenHighlighted = true
        SongWriterRoleCheckBox?.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        MelodyRoleCheckBox?.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        MelodyRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        MelodyRoleCheckBox?.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        MelodyRoleCheckBox?.adjustsImageWhenHighlighted = true
        MelodyRoleCheckBox?.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        //self.view.addSubview(checkbox)
    }
    
    @IBAction func checkboxSelected(_ sender: UIButton)
    {
        checkBoxSelected = !checkBoxSelected; /* Toggle */
        sender.isSelected = checkBoxSelected
    }

    @IBAction func showDetailsButtonPushed(_ sender: UIButton) {
        let cell = (sender as UIButton).superview?.superview?.superview as! ArtistTableViewCell // else {
        //            return // or fatalError() or whatever
        //        }
        //let id = cell?.reuseIdentifier
//        guard let artistcell = vc.ArtistTableView.dequeueReusableCell(withIdentifier: id!) as? ArtistTableViewCell else
//        {
//            return
//        }
    
        
        var indexPath : IndexPath = IndexPath(row: 0, section: 0)
        
        if vc.ArtistTableView != nil {
            indexPath = (vc.ArtistTableView?.indexPath(for: cell))!
        }
        
        
        if indexPath.row == 0 {
            if cellExpanded {
                cellExpanded = false
            } else {
                cellExpanded = true
            }
//            vc.ArtistTableView.beginUpdates()
//            vc.ArtistTableView.endUpdates()
        }
    }
    @IBAction func selectRow(_ sender: UIButton) {
        

        let cell = sender.superview?.superview?.superview as? ArtistTableViewCell // else {
//            return // or fatalError() or whatever
//        }
        let id = cell?.reuseIdentifier
        guard let artistcell = vc.ArtistTableView.dequeueReusableCell(withIdentifier: id!) as? ArtistTableViewCell else
            {
            return
        }
        
        let indexPath = vc.ArtistTableView!.indexPath(for: artistcell)
        
        if indexPath?.row == 0 {
            if cellExpanded {
                cellExpanded = false
            } else {
                cellExpanded = true
            }
            vc.ArtistTableView.beginUpdates()
            vc.ArtistTableView.endUpdates()
        }
    }
    
    public func configure(text: String?, placeholder: String) {
        LegalNameTextField.text = text
        LegalNameTextField.placeholder = placeholder
        
        LegalNameTextField.accessibilityValue = text
        LegalNameTextField.accessibilityLabel = placeholder
    }
}
