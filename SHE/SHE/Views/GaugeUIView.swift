//
//  GaugeView.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/07.
//

import SwiftUI
import GaugeKit

struct GaugeUIView: View {
    
    //상태변화 감지변수 @state
    @State private var data = 0

    var body: some View {
        //매초 저장된 db 확인후 data 변수 할당
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            data = Int(UserDefaults.standard.float(forKey: "db"))
        }
        //게이지바 설정
        GaugeView(title: "dB", value: Int(data), maxValue: 140, colors: [.blue, .cyan, .green, .yellow, .red])
        
            }
    
    
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        
        GaugeUIView()
    }
}

