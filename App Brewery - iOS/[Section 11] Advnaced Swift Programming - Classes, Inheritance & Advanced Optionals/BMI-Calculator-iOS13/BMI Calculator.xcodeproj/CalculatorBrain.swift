//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Harsh Chaturvedi on 18/09/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var bmi : BMI?
    
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (pow(height, 2))
        if bmiValue < 18.8 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else  {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
        
    }
    
    func getBMIValue() -> String {
        let bmi1Dec = String(format: "%.1f", bmi?.value ?? 0.00)
        return bmi1Dec
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice!x"
    }
    
    func getColor() ->  UIColor{
        return bmi?.color ?? #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
}
