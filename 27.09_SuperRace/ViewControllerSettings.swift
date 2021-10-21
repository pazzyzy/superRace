//
//  ViewController.swift
//  27.09_SuperRace
//
//  Created by Ant Zy on 30.09.2021.
//

import UIKit

class ViewControllerSettings: UIViewController {

    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var selectDifficulty: UISegmentedControl!
    @IBOutlet weak var selectCar: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func savePlayerName() -> String {
        let playerNameString:String = String(playerName.text!)
        return playerNameString
    }
    
    @IBAction func actionStartRace(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
        savePlayerName()
        let defaults = UserDefaults.standard
        defaults.set(savePlayerName(), forKey: "PlayerName")
        print(defaults.value(forKey: "PlayerName"))
    }
}
