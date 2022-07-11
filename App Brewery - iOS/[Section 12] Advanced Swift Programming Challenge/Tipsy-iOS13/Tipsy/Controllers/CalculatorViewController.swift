//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tipSelected = 10
    var total = 0.0
    var people = 2.0
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        var str = sender.currentTitle
        
        if let i = str?.firstIndex(of: "%"){
            str?.remove(at: i)
        }
         
        tipSelected = Int(str!)!
//        print(Float(str!)!/100.0)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        
        let bill = Float(billTextField.text!)!
        people = Double(Float(splitNumberLabel.text!)!)
        let tip = Float(tipSelected)/100.00
        
        total = Double(Double(bill+(bill*tip)) / people)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = total
            destinationVC.people = Int(people)
            destinationVC.tip = tipSelected        }
    }

}

