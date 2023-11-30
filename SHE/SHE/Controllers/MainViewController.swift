//
//  MainViewController.swift
//  SHE
//
//  Created by Duksu Jang on 2023/10/31.
//

import UIKit
import GaugeKit
import SwiftUI

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //게이지바가 띄워질 공간 view 설정
    @IBOutlet weak var gaugeView: UIView!
    
    //히스토리 테이블뷰
    @IBOutlet weak var tableView: UITableView!
    //스위치 상태 변수
    @IBOutlet weak var switchCheck: UISwitch!
    
    var popupVC : PopupViewController?
    //userdata에 userdefaults에서 가져온 dictionary 할당
    var userData : [String: Any] = UserDefaults.standard.object(forKey: "initData") as? [String: Any] ?? [:]
    
    var timer : Timer?
    
    //히스토리 테이블에 쓰일 array 형식 제공
    var historyTitle : [String] = []
    var historyTime : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchCheck.isOn = UserDefaults.standard.bool(forKey: "switch")
        //swiftui와 uikit의 view를 연결해줌
        let hostingController = UIHostingController(rootView: GaugeUIView())
        
        self.addChild(hostingController)
        self.gaugeView.addSubview(hostingController.view)
        hostingController.view.frame = gaugeView.bounds
        
        //테이블뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 20
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 2.0
        
                
        
        

    }
 
    //테이블뷰 열 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyTitle.count
    }
    //테이블 뷰 내용 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        cell.cellTitle.text = historyTitle[indexPath.row]
        cell.cellContents.text = historyTime[indexPath.row]
        
        return cell
    }
    //테이블뷰 제목 설정 "History"
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "History"
    }

    //테이블뷰 헤더 디자인
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .black
            headerView.backgroundView?.backgroundColor = .white
            headerView.textLabel?.textColor = .white
            
        }
    }
    //PopupViewController띄워주는 함수
    func popup() {
        DispatchQueue.main.sync {
            performSegue(withIdentifier: "toPopup", sender: self)
            
        }
        
        /*
        DispatchQueue.main.sync {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupVC")
            popupVC.modalPresentationStyle = .overFullScreen
            present(popupVC, animated: true, completion: nil)
            UserDefaults.standard.synchronize()
        }
         */
    }
    
    

    
    
    func getMethod() {
            guard let url = URL(string: "http://172.20.10.2:3000/history/latest") else {
                print("Error: cannot create URL")
                return
            }
            // Create the url request http://172.20.10.2:3000
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error: error calling GET")
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    print("Error: HTTP request failed")
                    return
                }
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }
                    
                    //가져온 json 데이터의 스위치, 알람 value값을 비교한다
                    let jsonSwitch = jsonObject["Switch"] as? Bool ?? false
                    let jsonAlarm = jsonObject["Alarm"] as? Bool ?? false
                    let jsonLabel = jsonObject["Label"] as? String ?? "null"
                    let userLabel = self.userData["Label"] as! String
                    let jsonTime = jsonObject["timestamp"] as? String ?? "00:00:00"
                    let userDB = jsonObject["decibels"] as? Float64 ?? 0.0
                    // 데시벨 저장, GaugeUIView 에서 사용할 것
                    UserDefaults.standard.set(userDB, forKey: "db")
                    print(userDB)
                    
                    // 시간 출력 테스트
                    print(jsonTime)
                    
                    // 만약 같다면 userdefaults에 저장
                    
                                        
                    //스위치, 알람 둘다 true이고 userdata와 jsondata가 다를때
                    if jsonSwitch == true && jsonAlarm == true && jsonLabel != userLabel {
                        
                        print(userLabel)
                        self.userData["Label"] = jsonLabel
                        UserDefaults.standard.set(1, forKey: "dismiss")
                        self.historyTitle.insert(jsonLabel, at: 0)
                        self.historyTime.insert(jsonTime, at: 0)
                        UserDefaults.standard.set(jsonLabel, forKey: "popLabel")
                        DispatchQueue.main.sync {
                            self.tableView.reloadData()
                        }
                        
                        self.popup()
                        
                    } else if jsonSwitch == true && jsonAlarm == true && jsonLabel == userLabel {
                        // 연이어 알람이 계속 올때
                        
                        print(userLabel)
                        UserDefaults.standard.set(1, forKey: "dismiss")
                        
                        //self.historyTitle.insert(userLabel, at: 0)
                        //self.historyTime.insert(jsonTime, at: 0)
                        //UserDefaults.standard.set(jsonLabel, forKey: "popLabel")
                        /*
                        DispatchQueue.main.sync {
                            self.tableView.reloadData()
                        }
                        */
                        //self.popup()
                    } else {
                        //위의 조건을 벗어날 시 userdata의 라벨 값을 초기화 시켜줌
                        self.userData["Label"] = "null"
                        UserDefaults.standard.set(0, forKey: "dismiss")
                    }
                    UserDefaults.standard.synchronize()
                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }.resume()
        }
   
    @IBAction func infoBtn(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "InfoVC")
        popupVC.modalPresentationStyle = .overFullScreen
        present(popupVC, animated: false, completion: nil)
    }
    
    @IBAction func toMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    
    @IBAction func dbSwitch(_ sender: UISwitch) {
   
        UserDefaults.standard.synchronize()
        if sender.isOn {
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.getMethod()
                }
        } else {
            UserDefaults.standard.set(0.0, forKey: "db")
            timer?.invalidate()
        }
        
    }
    
}
