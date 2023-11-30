//
//  Post.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/07.
//

import Foundation
    //
class DataDict {
    var bicycle: Bool
    var car: Bool
    var fire: Bool
    var infant: Bool
    var gun :Bool

    init(bicycle: Bool, car: Bool, fire: Bool, infant: Bool, gun: Bool) {
        self.bicycle = bicycle
        self.car = car
        self.fire = fire
        self.infant = infant
        self.gun = gun
    }
    
}

var datas = [DataDict]()
