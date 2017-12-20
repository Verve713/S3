//
//  ArtistTableViewCell.swift
//  Split Sheetz
//
//  Created by Verve on 12/4/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var LegalNameTextField: UITextField!
    @IBOutlet weak var ArtistNameTextField: UITextField!
    @IBOutlet weak var LabelNameTextField: UITextField!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var ComposerRoleCheckBox: UIButton!
    @IBOutlet weak var SongWriterRoleCheckBox: UIButton!
    @IBOutlet weak var MelodyRoleCheckBox: UIButton!
    @IBOutlet weak var PublishingCompanyTextField: UITextField!
    @IBOutlet weak var PublisherOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var PerformanceSocietyTextField: UITextField!
    @IBOutlet weak var IPISSNumberTextField: UITextField!
    @IBOutlet weak var MusicOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var LyricsOwnershipPercentageTextField: UITextField!
    @IBOutlet weak var AgreedUponNameTextField: UITextField!
    @IBOutlet weak var ESignatureTextField: UITextField!
    @IBOutlet weak var EffectiveDateTextField: UITextField!
    
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint?
    
    var checkBoxSelected: Bool = false
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded {
                self.cellHeightConstraint?.constant = 10.0
                
            } else {
                self.cellHeightConstraint?.constant = 520.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func roleCheckBox() {
        
        let image = UIImage(named: "notselectedcheckbox.png") as UIImage!
        //checkbox.frame = CGRect(x:100, y:120, width:20, height:20)
        
        ComposerRoleCheckBox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage!, for: .normal)
        ComposerRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        ComposerRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        ComposerRoleCheckBox.adjustsImageWhenHighlighted = true
        ComposerRoleCheckBox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        SongWriterRoleCheckBox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        SongWriterRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        SongWriterRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        SongWriterRoleCheckBox.adjustsImageWhenHighlighted = true
        SongWriterRoleCheckBox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        
        MelodyRoleCheckBox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
        MelodyRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .selected)
        MelodyRoleCheckBox.setBackgroundImage(UIImage(named: "selectedcheckbox.png") as UIImage?, for: .highlighted)
        MelodyRoleCheckBox.adjustsImageWhenHighlighted = true
        MelodyRoleCheckBox.addTarget(self, action: Selector("checkboxSelected:") , for: .touchUpInside)
        //self.view.addSubview(checkbox)
    }
    
    @IBAction func checkboxSelected(_ sender: UIButton)
    {
        checkBoxSelected = !checkBoxSelected; /* Toggle */
        sender.isSelected = checkBoxSelected
    }

    
}
