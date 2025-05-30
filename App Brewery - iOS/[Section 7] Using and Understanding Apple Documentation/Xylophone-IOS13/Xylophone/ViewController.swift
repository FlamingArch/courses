//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        dim(sender)
    }
    
    func playSound(soundName: String){
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /*iOS 10 and earlier rqeuire the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint:AVFileTypeMPEGLayer3*/
            
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    func dim(_ button: UIButton)
    {
        button.alpha /= 2
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            
            button.alpha *= 2
        }
        
    }
}

