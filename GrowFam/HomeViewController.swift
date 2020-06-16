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
    
    lazy var date = Date()
    
    let coin = UIImageView()
    let coinFrames: [UIImage] = [
        UIImage(named: "Coin 1")!,
        UIImage(named: "Coin 2")!,
        UIImage(named: "Coin 3")!,
        UIImage(named: "Coin 4")!,
        UIImage(named: "Coin 5")!,
        UIImage(named: "Coin 6")!,
        UIImage(named: "Coin 5 Copy")!,
        UIImage(named: "Coin 4 Copy")!,
        UIImage(named: "Coin 3 Copy 2")!,
        UIImage(named: "Coin 2 Copy")!,
    ]
    
    @IBOutlet weak var rainView: UIView!
    @IBOutlet weak var audioButton: UIButton!
    
    var isTap = true
    var coinTap = false
    
    let frame = UIView(frame: CGRect(x: 0, y: 200, width: 414, height: 600))
    var makeCoinAppear = UIGestureRecognizer()
    let overlayFrame = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
    
    let image1 = UIImage(systemName: "speaker.slash")
    let image2 = UIImage(systemName: "speaker.1")
    
    var player: AVAudioPlayer?
    var audioPlay = true
    
    var c1: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Cloud1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 0, y: 0, width: 155, height: 116)
        return imgView
    }()
    var c2: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Cloud3"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 212, y: 8, width: 154, height: 91)
        return imgView
    }()
    var c3: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Cloud2"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 53, y: 0, width: 240, height: 128)
        return imgView
    }()
    
    var raindrop1 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 100, y: 20, width: 25, height: 25)
        return imgView
    }()
    var raindrop2 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 130, y: 20, width: 25, height: 25)
        return imgView
    }()
    var raindrop3 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 170, y: 20, width: 25, height: 25)
        imgView.alpha = 0
        return imgView
    }()
    var raindrop4 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 150, y: 20, width: 25, height: 25)
        return imgView
    }()
    var raindrop5 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 200, y: 20, width: 25, height: 25)
        return imgView
    }()
    var raindrop6 : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Raindrop1"))
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: 230, y: 20, width: 25, height: 25)
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overlayFrame.alpha = 0

        let tap = UITapGestureRecognizer(target: self, action: #selector(flowerDidTapped))
        rainView.addGestureRecognizer(tap)
        
        makeCoinAppear =  UITapGestureRecognizer(target: self, action: #selector(setupCoin))
        frame.addGestureRecognizer(makeCoinAppear)
        
        playSound(file: "NC3")
        
        setupRain()
        view.addSubview(frame)
    }
    
    @objc private func setupCoin() {
        if coinTap == true {
            overlayFrame.alpha = 0
        } else {

        overlayFrame.alpha = 1
        overlayFrame.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        overlayFrame.layer.opacity = 0.6

        let coinFrame = CGRect(x: view.center.x - 100, y: view.center.y - 100, width: 200, height: 200)

        coin.frame = coinFrame
        coin.image = UIImage(named: "Coin 1")

        coin.animationImages = coinFrames
        coin.animationDuration = 2
        coin.animationRepeatCount = 5

        let tapCoin = UITapGestureRecognizer(target: self, action: #selector(animateCoin))
        overlayFrame.addGestureRecognizer(tapCoin)
        
        view.addSubview(overlayFrame)
        view.addSubview(coin)
        }
    }

    @objc func animateCoin() {
        coin.startAnimating()
        let secondsToDelay = 10.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            self.coinTap = true
            
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.overlayFrame.layer.opacity = 0
            self.overlayFrame.alpha = 0
            self.coin.alpha = 0
            self.view.removeGestureRecognizer(self.makeCoinAppear)
            self.frame.removeFromSuperview()
        }
    }
    
    private func setupRain() {
        isTap = false
        c1.alpha = 0
        c2.alpha = 0
        c3.alpha = 0
        
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
        
        rainView.addSubview(c1)
        rainView.addSubview(c2)
        rainView.addSubview(c3)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetCloud()
        resetRain()
    }
    
    @objc func flowerDidTapped() {
        if isTap == true {
            resetRain()
            isTap = false
        }
        
//        if coinTap == true {
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                self.c1.alpha = 1
                self.c2.alpha = 1
                self.c3.alpha = 1
            }) { (isAnimated) in
                print("Cloud appeared")
            }
            
            UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
                self.raindrop1.alpha = 1
                self.raindrop2.alpha = 1
                self.raindrop3.alpha = 1
                self.raindrop4.alpha = 1
                self.raindrop5.alpha = 1
                self.raindrop6.alpha = 1
            }) { (isAnimated) in
                print("Airdrop already appeared")
            }
            
            UIView.animate(withDuration: 2, delay: 1, options: .curveLinear, animations: {
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
            }) { (isAnimate) in
                self.isTap = true
            }
    }
    
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
    
    private func resetCloud() {
        self.c1.alpha = 0
        self.c2.alpha = 0
        self.c3.alpha = 0
    }
    
    private func resetRain() {
        self.raindrop1.alpha = 0
        self.raindrop2.alpha = 0
        self.raindrop3.alpha = 0
        self.raindrop4.alpha = 0
        self.raindrop5.alpha = 0
        self.raindrop6.alpha = 0
        
        self.raindrop1.frame.origin.y = 20
        self.raindrop2.frame.origin.y = 20
        self.raindrop3.frame.origin.y = 20
        self.raindrop4.frame.origin.y = 20
        self.raindrop5.frame.origin.y = 20
        self.raindrop6.frame.origin.y = 20
    }
    
    @IBAction func speakerClicked(_ sender: UIButton) {
        if audioPlay == true{
            player?.pause()
            audioPlay = false
            audioButton.setImage(image1, for: .normal)
        } else {
            player?.play()
            audioPlay = true
            audioButton.setImage(image2, for: .normal)
        }
        
    }
}
