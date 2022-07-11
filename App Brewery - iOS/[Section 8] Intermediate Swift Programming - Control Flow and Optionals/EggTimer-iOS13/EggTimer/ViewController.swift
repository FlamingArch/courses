//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggtime = [ "Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    var secondsPassed = 60
    var totalTime = 60
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        let hardness = sender.currentTitle!
        totalTime = eggtime[hardness]!
        secondsPassed = 0

        progressBar.progress = 0

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
        
        @objc func update() {
            if(secondsPassed < totalTime){
                progressBar.progress = Float(secondsPassed)/Float(totalTime)
                secondsPassed+=1
            }
            else{
                timer.invalidate()
                titleLabel.text = "Done"
            }
        }
        
    }
    
