//
//  ViewController.swift
//  SHE
//
//  Created by Duksu Jang on 2023/10/31.
//

import UIKit

class StartViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    
    // post 메소드로 가져올 형식
    var dataDict: [String: Any] = [:]
    // get 메소드로 가져올 데이타 형식
    var initData : [String: Any] = [
        "timestamp" : "",
        "Alarm" : false,
        "Switch" : false,
        "Label" : "Infant Crying",
        "Tagging_rate" : 0.000000000000001,
        "decibels" : 00.00000000000000
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get이랑 post에 쓰일 형식데이터를 userdefaults에 저장
        defaults.set(dataDict, forKey: "dataDict")
        defaults.set(initData, forKey: "initData")
        
        defaults.set(false, forKey: "switch")
        
        //메뉴 버튼 초기값 설정
        UserDefaults.standard.setValue(0, forKey: "btn1")
        UserDefaults.standard.setValue(0, forKey: "btn2")
        UserDefaults.standard.setValue(0, forKey: "btn3")
        UserDefaults.standard.setValue(0, forKey: "btn4")
        UserDefaults.standard.setValue(0, forKey: "btn5")
        UserDefaults.standard.setValue(0, forKey: "btn6")
        UserDefaults.standard.setValue(0, forKey: "btn7")
        UserDefaults.standard.setValue(0, forKey: "btn8")
        UserDefaults.standard.setValue(0, forKey: "btn9")
        
        //db 값 시작과 동시에 초기화
        UserDefaults.standard.set(0.0, forKey: "db")
        print(initData)
        // Do any additional setup after loading the view.
    }
    
    
    //MainViewController로 넘겨주는 버튼
    @IBAction func startBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toMain", sender: self)
    }
    
}
