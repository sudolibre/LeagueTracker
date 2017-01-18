//
//  Team.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class Team: Equatable, Hashable {
    var name: String
    
    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs === rhs
    }
    
    var hashValue: Int {
        return name.hashValue
    }
    
    init(name: String) {
        self.name = name
    }
}
