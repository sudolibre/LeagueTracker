//
//  ViewController.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import UIKit

class GameListController: UIViewController, UITableViewDelegate {
    @IBAction func addGameTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addGameVC = storyBoard.instantiateViewController(withIdentifier: "newGame")
        present(addGameVC, animated: true)
    }
    
    var dataSource: GameStore!
    var tableView: UITableView {
        return view as! UITableView
    }

}

