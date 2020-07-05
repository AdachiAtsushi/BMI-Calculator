//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

//    var bmiValue = "0.0"
    
    var calculatorBrain = CalculatorBrain()
    
    // ========= IBOutlet ===========
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // ========= IBAction ==========
    // sliderで身長を変更する
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    // sliderで体重を変更する
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // sliderが保持する身長、体重を取得
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // BMIを算出する
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        // 画面遷移を行う
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueの識別子が"goToResult"だった場合
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            // BMIを取得後、次画面に値を連携
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

