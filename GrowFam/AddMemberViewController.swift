//
//  AddMemberViewController.swift
//  GrowFam
//
//  Created by Andrew Novansky Ignatius on 13/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class AddMemberViewController: UIViewController {
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var NameTextArea: UITextField!
    @IBOutlet weak var RoleTextArea: UITextField!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        super.viewDidLoad()
        ProfileImageView.image = #imageLiteral(resourceName: "Daughter")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
           
           if segue.identifier == "unwindToMember" {
               if let destination = segue.destination as? MemberPageViewController {
                destination.imageNameTemp = "Daughter"
                destination.nameTemp = NameTextArea.text!
                destination.roleTemp = RoleTextArea.text!
                destination.taskTemp = "0/3"
               }
           }
       }


}
