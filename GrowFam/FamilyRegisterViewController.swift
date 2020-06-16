//
//  FamilyRegisterViewController.swift
//  GrowFam
//
//  Created by Andrew Novansky Ignatius on 15/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit


class FamilyRegisterViewController: UIViewController {
    
    
    @IBOutlet weak var FamilyNameTextArea: UITextField!
    @IBOutlet weak var FamilyNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        FamilyNumberLabel.text = "\(temp)"
    }
    
    @IBAction func SubButton(_ sender: Any) {
        if temp>0 {
            temp -= 1
            FamilyNumberLabel.text = "\(temp)"
        }
    }
    @IBAction func PlusButton(_ sender: Any) {
        if temp<10{
            temp += 1
            FamilyNumberLabel.text = "\(temp)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "RegisterToMember" {
            if let destination = segue.destination as? MemberPageViewController {
            }
        }
    }
}
