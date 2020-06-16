//
//  PopUpViewController.swift
//  GrowFam
//
//  Created by Gilbert Gozalie on 6/12/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet var helpPage: UIView!
    var tapGesture = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
       super.viewDidLoad()
       // TAP Gesture
       tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
       tapGesture.numberOfTapsRequired = 1
       tapGesture.numberOfTouchesRequired = 1
       helpPage.addGestureRecognizer(tapGesture)
       helpPage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
   @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
    print("Hello")
    dismiss(animated: true, completion: nil)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
