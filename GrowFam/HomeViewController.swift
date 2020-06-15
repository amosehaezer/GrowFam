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
//        let home = UITabBarItem()
//        home.title = "Home"
//        home.image = UIImage(named: "Dad")
//        
//        let achievement = UITabBarItem()
//        achievement.title = "Achievement"
//        
//        let member = UITabBarItem()
//        member.title = "Member"
//        
//        let homeVC = HomeViewController()
//        homeVC.tabBarItem = home
//        
//        let achievementVC = AchievementVC()
//        achievementVC.tabBarItem = achievement
//        
//        let memberVC = MemberProfileVC()
//        memberVC.tabBarItem = member
//        
//        let tabBar = UITabBarController()
//        tabBar.viewControllers = [member, home, achievement]
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
