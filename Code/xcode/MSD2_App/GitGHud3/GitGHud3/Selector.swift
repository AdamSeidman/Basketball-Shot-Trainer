//
//  Selector.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import Foundation

class Selector:ObservableObject{
    @Published var select:String?
    init(){
        self.select = "none"
    }
}
