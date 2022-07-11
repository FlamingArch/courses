//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%dKg", Int(sender.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / (pow(height, 2))
        print(bmi)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(bmi)
        self.present(secondVC, animated: true, completion: nil)
    }
    

}
