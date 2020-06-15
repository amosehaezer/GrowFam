//
//  HomeViewController.swift
//  GrowFam
//
//  Created by Gilbert Gozalie on 6/12/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    //ibOutlet
    @IBOutlet weak var audioButton: UIButton!
    let image1 = UIImage(systemName: "speaker.slash")
    let image2 = UIImage(systemName: "speaker.1")
    
    
    //image configuration
    
    let muteimage = UIImage(systemName:  "speaker.slash", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    let speakerimage = UIImage(systemName: "speaker.1", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    
    //
    var player: AVAudioPlayer?
    var audioPlay = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //function buat jalanin musik
    
    @IBAction func SpeakerClicked(_ sender: Any) {
        if audioPlay == true{
            audioPlay = false
            //audioButton.currentImage = muteimage
        }
        if audioPlay == false {
            audioPlay = true
            //audioButton.currentImage = speakerimage
        }
    }
    
    
    

}
