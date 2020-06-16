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
    
    var animatorProperty = UIViewPropertyAnimator()
    
    @IBOutlet weak var rainView: UIView!
    @IBOutlet weak var audioButton: UIButton!
    
    var isTap = true
    
    let image1 = UIImage(systemName: "speaker.slash")
    let image2 = UIImage(systemName: "speaker.1")
    
    //image configuration
    
    let muteimage = UIImage(systemName:  "speaker.slash", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    let speakerimage = UIImage(systemName: "speaker.1", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    
    var player: AVAudioPlayer?
    var audioPlay = true
    
    var raindrop1 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 100, y: -30, width: 25, height: 25)
        return imgView
    }()
    var raindrop2 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 130, y: -50, width: 25, height: 25)
        return imgView
    }()
    var raindrop3 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 170, y: -100, width: 25, height: 25)
        return imgView
    }()
    var raindrop4 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 150, y: -70, width: 25, height: 25)
        return imgView
    }()
    var raindrop5 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 200, y: -20, width: 25, height: 25)
        return imgView
    }()
    var raindrop6 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 230, y: -5, width: 25, height: 25)
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(flowerDidTapped))
        rainView.addGestureRecognizer(tap)
//        playSound(file: "NC3")
        
        setupRain()
    }
    
    private func setupRain() {
        isTap = false
        
        raindrop1.alpha = 0
        raindrop2.alpha = 0
        raindrop3.alpha = 0
        raindrop4.alpha = 0
        raindrop5.alpha = 0
        raindrop6.alpha = 0
        
        rainView.addSubview(raindrop1)
        rainView.addSubview(raindrop2)
        rainView.addSubview(raindrop3)
        rainView.addSubview(raindrop4)
        rainView.addSubview(raindrop5)
        rainView.addSubview(raindrop6)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func flowerDidTapped() {
        
        if isTap == true {
            resetRain()
            isTap = false
        }
        
        UIView.animate(withDuration: 0.2) {
            self.raindrop1.alpha = 1
            self.raindrop2.alpha = 1
            self.raindrop3.alpha = 1
            self.raindrop4.alpha = 1
            self.raindrop5.alpha = 1
            self.raindrop6.alpha = 1
        }
        
        UIView.animate(withDuration: 2) {
            self.raindrop1.frame.origin.y = self.rainView.frame.height + 10
            self.raindrop2.frame.origin.y = self.rainView.frame.height + 38
            self.raindrop3.frame.origin.y = self.rainView.frame.height + 50
            self.raindrop4.frame.origin.y = self.rainView.frame.height + 35
            self.raindrop5.frame.origin.y = self.rainView.frame.height + 70
            self.raindrop6.frame.origin.y = self.rainView.frame.height + 100
            
            self.raindrop1.alpha = 0
            self.raindrop2.alpha = 0
            self.raindrop3.alpha = 0
            self.raindrop4.alpha = 0
            self.raindrop5.alpha = 0
            self.raindrop6.alpha = 0
            self.isTap = true
        }
    }
    
    //function buat jalanin musik
    private func playSound(file: String) {
        do {
            guard let url = Bundle.main.url(forResource: file, withExtension: "mp3") else {return}
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.numberOfLoops = 10000
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func resetRain() {
        self.raindrop1.frame.origin.y = -30
        self.raindrop2.frame.origin.y = -50
        self.raindrop3.frame.origin.y = -100
        self.raindrop4.frame.origin.y = -70
        self.raindrop5.frame.origin.y = -20
        self.raindrop6.frame.origin.y = -5
    }
    
    @IBAction func SpeakerClicked(_ sender: Any) {
        if audioPlay == true{

            player?.pause()
            audioPlay = false
//            audioButton.currentImage = muteimage
        } else {
            player?.play()
            audioPlay = true
//            audioButton.currentImage = speakerimage
        }
    }
    
    
    

}
