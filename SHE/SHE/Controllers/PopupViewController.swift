//
//  PopupViewController.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/09.
//

import UIKit

class PopupViewController : UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var infoView: UIView!
    
    var userLabel : [String: Any] = UserDefaults.standard.object(forKey: "initData") as? [String: Any] ?? [:]
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view가 로드되면 라벨의 텍스트를 저장된 popLabel에서 가져옴
        Label.text = UserDefaults.standard.string(forKey: "popLabel")
        // 라벨 텍스트에 따라 백그라운드 색깔 지정
        if Label.text == "Infant Crying" {
            infoView.backgroundColor = .systemGreen
        } else if Label.text == "Bicycle Bell" {
            infoView.backgroundColor = .systemBlue
        } else if Label.text == "Car horn" {
            infoView.backgroundColor = .systemOrange
        } else if Label.text == "Siren" {
            infoView.backgroundColor = .systemRed
        } else if Label.text == "Glass" {
            infoView.backgroundColor = .systemTeal
        } else if Label.text == "Screaming" {
            infoView.backgroundColor = .systemYellow
        } else if Label.text == "Explosion" {
            infoView.backgroundColor = .systemIndigo
        } else if Label.text == "Dog bark" {
            infoView.backgroundColor = .systemBrown
        } else if Label.text == "Tools" {
            infoView.backgroundColor = .systemPurple
        }
        
        let containerView = UIView()
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 1
        containerView.addSubview(infoView)
        
        // infoView 모서리 둥글게 만들기
        infoView.layer.cornerRadius = 25
        infoView.clipsToBounds = true
        view.addSubview(containerView)
        
        // containerView 에 대해 Auto Layout 설정
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        
        //매초 저장된 데이터 확인후 dismiss 데이터 확인시 dismiss
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if UserDefaults.standard.integer(forKey: "dismiss") == 0 {
                self.dismiss(animated: true, completion: nil)
            }
        })
    
        
    }
    

    
    @IBAction func okBtn(_ sender: UIButton) {
       
        self.dismiss(animated: true, completion: nil)
        
    }
    

 
}
