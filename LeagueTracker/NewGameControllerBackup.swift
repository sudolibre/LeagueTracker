//
//  NewGameController.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class NewGameControllerBackup: UIViewController, UITableViewDelegate, 
@IBOutlet var homeTeamTextField: UITextField!
UITableViewDataSource {
    var dataSource: GameStore!
    var scoringEvents = [(Team, ScoringEvent)]()
    
    @IBAction func savePressed(_ sender: UIButton) {
        guard let homeTeamName = homeTextField.text,
            let visitingTeamName = visitingTextField.text else {
                let ac = UIAlertController(title: "Save Failed", message: "Please enter team names!", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                present(ac, animated: true)
        }
        let homeTeam = Team(name: homeTeamName)
        let visitingTeam = Team(name: visitingTeamName)
        let game = Game(homeTeam: homeTeam, visitingTeam: visitingTeam, scoringEvents: scoringEvents)
        dataSource.addGame(game)
    }
    
    @IBOutlet var visitingTextField: UITextField!
    @IBOutlet var homeTextField: UITextField!
    @IBOutlet var scorePicker: UIPickerView!
    @IBOutlet var pickerTopConstraint: NSLayoutConstraint!
    @IBOutlet var scoringTableView: UITableView!
    @IBAction func addScoringEvent(_ sender: UIButton) {
        
        guard let homeTeamName = homeTextField.text,
            let visitingTeamName = visitingTextField.text else {
                let ac = UIAlertController(title: "Save Failed", message: "Please enter team names!", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                present(ac, animated: true)
        }
        
        var team: Team
        
        let acEvent = UIAlertController(title: "Choose Event", message: nil, preferredStyle: .alert)
        let touchDownAction = UIAlertAction(title: "Touchdown!!", style: .default) { (alert) in
            let event = ScoringEvent.touchDown
            self.scoringEvents.append((team, event))
        }
        let extraPointAction = UIAlertAction(title: "Extra Point", style: .default) { (alert) in
            let event = ScoringEvent.extraPoint
            self.scoringEvents.append((team, event))
        }
        let fieldGoalAction = UIAlertAction(title: "Field Goal", style: .default) { (alert) in
            let event = ScoringEvent.fieldGoal
            self.scoringEvents.append((team, event))
        }
        let safteyAction = UIAlertAction(title: "Saftey", style: .default) { (alert) in
            let event = ScoringEvent.saftey
            self.scoringEvents.append((team, event))
        }
        let twoPointConversionAction = UIAlertAction(title: "Two Point Conversion", style: .default) { (alert) in
            let event = ScoringEvent.twoPointConversion
            self.scoringEvents.append((team, event))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        acEvent.addAction(touchDownAction)
        acEvent.addAction(extraPointAction)
        acEvent.addAction(fieldGoalAction)
        acEvent.addAction(safteyAction)
        acEvent.addAction(twoPointConversionAction)
        acEvent.addAction(cancelAction)
        
        let acTeam = UIAlertController(title: "Choose Team", message: nil, preferredStyle: .alert)
        let homeTeamAction = UIAlertAction(title: homeTeamName, style: .default) { (alert) in team = Team(name: homeTeamName)
           self.present(acEvent, animated: true)
        }
        let visitingTeamAction = UIAlertAction(title: homeTeamName, style: .default) { (alert) in team = Team(name: visitingTeamName)
            self.present(acEvent, animated: true)
        }
        acTeam.addAction(homeTeamAction)
        acTeam.addAction(visitingTeamAction)
        present(acTeam, animated: true)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoringEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell")!
        let event = scoringEvents[indexPath.row]
        
        cell.textLabel!.text = "\(event.0.name): \(event.1.description)"
        cell.detailTextLabel!.text = event.1.points.description
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
