//
//  MenuViewController.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/02.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    

    var data : [String: Any] = UserDefaults.standard.object(forKey: "dataDict") as? [String: Any] ?? [:]
    
    var keys : [String] = ["btn1", "btn2", "btn3", "btn4", "btn5"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // 버튼 디자인
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        btn5.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
        btn7.layer.cornerRadius = 10
        btn8.layer.cornerRadius = 10
        btn9.layer.cornerRadius = 10
        
    
        // userdefaults에 저장된 integer로 버튼 상태 기억
        if UserDefaults.standard.integer(forKey: "btn1") == 0 {
            btn1.backgroundColor = .gray
            btn1.layer.shadowOpacity = 0
        } else {
            btn1.backgroundColor = .systemGreen
            btn1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn1.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn1.layer.shadowRadius = 5
            btn1.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn2") == 0 {
            btn2.backgroundColor = .gray
            btn2.layer.shadowOpacity = 0
        } else {
            btn2.backgroundColor = .systemBlue
            btn2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn2.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn2.layer.shadowRadius = 5
            btn2.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn3") == 0 {
            btn3.backgroundColor = .gray
            btn3.layer.shadowOpacity = 0
        } else {
            btn3.backgroundColor = .systemOrange
            btn3.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn3.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn3.layer.shadowRadius = 5
            btn3.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn4") == 0 {
            btn4.backgroundColor = .gray
            btn4.layer.shadowOpacity = 0
        } else {
            btn4.backgroundColor = .systemRed
            btn4.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn4.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn4.layer.shadowRadius = 5
            btn4.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn5") == 0 {
            btn5.backgroundColor = .gray
            btn5.layer.shadowOpacity = 0
        } else {
            btn5.backgroundColor = .systemTeal
            btn5.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn5.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn5.layer.shadowRadius = 5
            btn5.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn6") == 0 {
            btn6.backgroundColor = .gray
            btn6.layer.shadowOpacity = 0
        } else {
            btn6.backgroundColor = .systemYellow
            btn6.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn6.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn6.layer.shadowRadius = 5
            btn6.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn7") == 0 {
            btn7.backgroundColor = .gray
            btn7.layer.shadowOpacity = 0
        } else {
            btn7.backgroundColor = .systemIndigo
            btn7.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn7.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn7.layer.shadowRadius = 5
            btn7.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn8") == 0 {
            btn8.backgroundColor = .gray
            btn8.layer.shadowOpacity = 0
        } else {
            btn8.backgroundColor = .systemBrown
            btn8.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn8.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn8.layer.shadowRadius = 5
            btn8.layer.shadowOpacity = 1
        }
        if UserDefaults.standard.integer(forKey: "btn9") == 0 {
            btn9.backgroundColor = .gray
            btn9.layer.shadowOpacity = 0
        } else {
            btn9.backgroundColor = .systemPurple
            btn9.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn9.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn9.layer.shadowRadius = 5
            btn9.layer.shadowOpacity = 1
        }
        
       
    }
    

    
    @IBAction func btn1Pressed(_ sender: UIButton) {
        
        if UserDefaults.standard.integer(forKey: "btn1") == 0 {
            btn1.backgroundColor = .systemGreen
            btn1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn1.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn1.layer.shadowRadius = 5
            btn1.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn1")
            data["Infant Crying"] = true
            UserDefaults.standard.synchronize()
            
        } else {
            btn1.backgroundColor = .gray
            btn1.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn1")
            data["Infant Crying"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn2Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn2") == 0 {
            btn2.backgroundColor = .systemBlue
            btn2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn2.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn2.layer.shadowRadius = 5
            btn2.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn2")
            data["Bicycle Bell"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn2.backgroundColor = .gray
            btn2.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn2")
            data["Bicycle Bell"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn3Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn3") == 0 {
            btn3.backgroundColor = .systemOrange
            btn3.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn3.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn3.layer.shadowRadius = 5
            btn3.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn3")
            data["Car horn"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn3.backgroundColor = .gray
            btn3.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn3")
            data["Car horn"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn4Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn4") == 0 {
            btn4.backgroundColor = .systemRed
            btn4.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn4.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn4.layer.shadowRadius = 5
            btn4.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn4")
            data["Siren"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn4.backgroundColor = .gray
            btn4.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn4")
            data["Siren"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn5Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn5") == 0 {
            btn5.backgroundColor = .systemTeal
            btn5.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn5.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn5.layer.shadowRadius = 5
            btn5.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn5")
            data["Glass"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn5.backgroundColor = .gray
            btn5.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn5")
            data["Glass"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn6Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn6") == 0 {
            btn6.backgroundColor = .systemYellow
            btn6.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn6.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn6.layer.shadowRadius = 5
            btn6.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn6")
            data["Screaming"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn6.backgroundColor = .gray
            btn6.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn6")
            data["Screaming"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn7Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn7") == 0 {
            btn7.backgroundColor = .systemIndigo
            btn7.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn7.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn7.layer.shadowRadius = 5
            btn7.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn7")
            data["Explosion"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn7.backgroundColor = .gray
            btn7.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn7")
            data["Explosion"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn8Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn8") == 0 {
            btn8.backgroundColor = .systemBrown
            btn8.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn8.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn8.layer.shadowRadius = 5
            btn8.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn8")
            data["Dog bark"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn8.backgroundColor = .gray
            btn8.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn8")
            data["Dog bark"] = false
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func btn9Pressed(_ sender: UIButton) {
        if UserDefaults.standard.integer(forKey: "btn9") == 0 {
            btn9.backgroundColor = .systemPurple
            btn9.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            btn9.layer.shadowOffset = CGSize(width: 1, height: 4)
            btn9.layer.shadowRadius = 5
            btn9.layer.shadowOpacity = 1
            UserDefaults.standard.set(1, forKey: "btn9")
            data["Tools"] = true
            UserDefaults.standard.synchronize()
        } else {
            btn9.backgroundColor = .gray
            btn9.layer.shadowOpacity = 0
            UserDefaults.standard.set(0, forKey: "btn9")
            data["Tools"] = false
            UserDefaults.standard.synchronize()
        }
    }
    

    
    @IBAction func doneBtn(_ sender: UIButton) {
        // post로 스위치 데이터 정보 전달
        guard let url = URL(string: "http://172.20.10.2:3000/switch") else {
            return
        }
        
        // Create a dictionary with the key-value pairs
    
        print(data)
        
        // Convert the dictionary to JSON data
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else {
                    return
                }
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
            }.resume()
        } catch {
            print("Error converting data to JSON: \(error)")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
