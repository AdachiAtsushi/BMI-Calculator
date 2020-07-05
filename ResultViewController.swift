//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 安達篤史 on 2020/07/04.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // ========== IBOutlet定義 ==========
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    // BMI表示用テキスト
    var bmiValue: String?
    // アドバイス表示用テキスト
    var advice: String?
    // 背景色
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    // ========== IBAction ===========
    // 遷移元の画面に遷移
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
