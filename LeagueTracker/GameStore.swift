//
//  GameStore.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class GameStore: NSObject, UITableViewDataSource {
    private(set) var games = [Game]()
    
    var teams: Set<Team> {
        var teamSet = Set<Team>()
        
        for i in games {
            teamSet.insert(i.homeTeam)
            teamSet.insert(i.visitingTeam)
        }
        return teamSet
    }
    
    internal func getGamesForTeam(_ team: Team) -> [Game] {
        return games.filter { $0.homeTeam == team || $0.visitingTeam == team }
    }
    
    internal func addGame(_ game: Game) {
        games.append(game)
    }
    
    internal func updateGame(_ game: Game, withNewGame newGame: Game) {
        if let index = games.index(where: { $0 === game } ) {
        games[index] = newGame
        } else {
            print("No game with the provided identity could be found in Game Store to update")
        }
    }
    
    internal func deleteGame(_ game: Game) {
        if let index = games.index(where: { $0 === game } ) {
        games.remove(at: index)
        } else {
            print("No game with the provided identity could be found in Game Store to remove")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            return games.count
        case 2:
            return teams.count
        default:
            fatalError("tablview tag not found or unexpected")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier: String
        let mainText: String
        
        switch tableView.tag {
        case 1:
            reuseIdentifier = "gameCell"
            let game = games[indexPath.row]
            mainText = "\(game.homeTeam.name) (\(game.homeTeamScore)) v. \(game.visitingTeam.name) (\(game.visitingTeamScore))"
        case 2:
            reuseIdentifier = "teamCell"
            let index = teams.index(teams.startIndex, offsetBy: indexPath.row)
            let team = teams[index]
            mainText = "\(team.name)"
        default:
            fatalError("tablview tag not found or unexpected")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
        cell.textLabel!.text = mainText
        return cell
    }
    
}
