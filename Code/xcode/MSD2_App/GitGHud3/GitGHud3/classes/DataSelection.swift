//
//  DataSelection.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/6/21.
//

import Foundation
import UIKit


class DataSelection: ObservableObject {
    @Published var coachID:UUID?
    @Published var teamID:UUID?
    @Published var playerID:UUID?

}
