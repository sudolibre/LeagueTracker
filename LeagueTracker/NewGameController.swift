//
//  NewGameController.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class NewGameController: UIViewController, UITextFieldDelegate {
    var dataSource: GameStore!
    
    @IBOutlet var visitingTeamScore: UITextField!
    @IBOutlet var homeTeamScore: UITextField!
    @IBOutlet var homeTeamTextField: UITextField!
    @IBOutlet var visitingTeamTextField: UITextField!
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let homeTeamName = homeTeamTextField.text,
            let visitingTeamName = visitingTeamTextField.text,
        homeTeamScore.text != nil,
        let homeTeamScoreAmount = Int(homeTeamScore.text!),
            visitingTeamScore.text != nil,
            let visitingTeamScoreAmount = Int(visitingTeamScore.text!) else {
                let ac = UIAlertController(title: "Save Failed", message: "Please enter team names", preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
                present(ac, animated: true)
        }
        let homeTeam = Team(name: homeTeamName)
        let visitingTeam = Team(name: visitingTeamName)
        let game = Game(homeTeam: homeTeam, visitingTeam: visitingTeam, scoringEvents: <#T##[(Team, ScoringEvent)]#>)
        dataSource.addGame(game)
        
        
        
    }
    
}
