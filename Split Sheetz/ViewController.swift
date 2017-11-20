//
//  ViewController.swift
//  Split Sheetz
//
//  Created by Verve on 11/19/17.
//  Copyright © 2017 Verve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var checkBoxSelected: Bool = false
    @IBOutlet var checkbox: UIButton!
    @IBOutlet weak var ComposerCheckbox: UIButton!
    @IBOutlet weak var SongWriterCheckbox: UIButton!
    @IBOutlet weak var MelodyCheckbox: UIButton!
    @IBOutlet weak var cellView: UIView!
    //@IBOutlet var view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.delegate = self
        roleCheckBox()
    }
    
    func viewDidAppear() {
        //super.viewDidAppear()
        //roleCheckBox()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func roleCheckBox() {
        
        let image = UIImage(named: "notselectedcheckbox.png") as UIImage?
        //checkbox.frame = CGRect(x:100, y:120, width:20, height:20)
        
        ComposerCheckbox.setBackgroundImage(UIImage(named: "notselectedcheckbox.png") as UIImage?, for: .normal)
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
    }
}
