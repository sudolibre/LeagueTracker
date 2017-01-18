//
//  TeamListController.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class TeamListController: UIViewController, UITableViewDelegate {
    @IBAction func addGameTapped(_ sender: UIButton) {
    }
    var dataSource: GameStore!
    
    var tableView: UITableView {
        return view as! UITableView
    }

}
