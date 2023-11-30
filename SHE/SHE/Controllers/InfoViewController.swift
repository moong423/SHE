//
//  InfoViewController.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/14.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoView2: UIView!
    
    @IBOutlet weak var dbImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let containerView = UIView()
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 1
        containerView.addSubview(infoView2)
        
        // infoView 모서리 둥글게 만들기
        dbImage.layer.cornerRadius = 25
        infoView2.layer.cornerRadius = 25
        infoView2.clipsToBounds = true
        view.addSubview(containerView)
        
        // containerView 에 대해 Auto Layout 설정
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        
    }
    @IBAction func xBtn(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    

}
