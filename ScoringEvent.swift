//
//  ScoringEvent.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

enum ScoringEvent {
    case touchDown, fieldGoal, saftey, extraPoint, twoPointConversion
    
    var points: Int {
        switch self {
        case .touchDown:
            return 6
        case .extraPoint:
            return 1
        case .fieldGoal:
            return 3
        case .saftey:
            return 2
        case .twoPointConversion:
            return 2
        }
    }
    
    var description: String {
        switch self {
        case .touchDown:
            return "Touch Down"
        case .extraPoint:
            return "Extra Point"
        case .fieldGoal:
            return "Field Goal"
        case .saftey:
            return "Saftey"
        case .twoPointConversion:
            return "Two Point Conversion"
        }
    }
    
}
