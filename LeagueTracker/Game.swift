//
//  Game.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class Game {
    internal var homeTeam: Team
    internal var homeTeamScore: Int

    internal var visitingTeam: Team
    internal var visitingTeamScore: Int
    
    init(homeTeam: Team, visitingTeam: Team, scoringEvents: [(Team, ScoringEvent)]) {
        self.homeTeam = homeTeam
        self.visitingTeam = visitingTeam
        
        homeTeamScore = 0
        visitingTeamScore = 0
        
        for i in scoringEvents {
            switch i.0 {
            case homeTeam:
                homeTeamScore += i.1.points
            case visitingTeam:
                visitingTeamScore += i.1.points
            default:
                fatalError()
            }
        }
    }

}
