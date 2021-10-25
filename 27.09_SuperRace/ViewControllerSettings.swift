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
    @IBOutlet weak var pointsScreen: UIImageView!
    @IBOutlet weak var classicCarImage: UIImageView!
    @IBOutlet weak var formula1CarImage: UIImageView!
    
    var x:Bool = true
    var y:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCar()
        print(NSHomeDirectory())
        
    }
    func updateView() {
        classicCarImage.isHidden = (selectCar.selectedSegmentIndex == 1)
        formula1CarImage.isHidden = (selectCar.selectedSegmentIndex == 0)
        
        x = (selectCar.selectedSegmentIndex == 0)
        y = (selectDifficulty.selectedSegmentIndex == 0)
        print("\n")
        print(y)
        print(x)
        
    }
    
    func setupCar() {
        updateView()
        selectCar.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        selectDifficulty.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
    }
    
    @objc func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }
    
    func savePlayerName() -> String {
        let playerNameString:String = String(playerName.text!)
        return playerNameString
    }
    
    func writePlayerName() {
        let defaults = UserDefaults.standard
        defaults.set(savePlayerName(), forKey: "PlayerName")
        print(defaults.value(forKey: "PlayerName") as Any)
    }
    
    func savePlayerCar() -> Bool {
        let _:Bool = x
        return x
    }
    
    func writePlayerCar() {
        let defaults = UserDefaults.standard
        defaults.set(savePlayerCar(), forKey: "PlayerCar")
        print(defaults.value(forKey: "PlayerCar") as Any)
    }
    
    func savePlayerDifficulty() -> Bool {
        let _:Bool = y
        return y
    }
    
    func writePlayerDifficulty() {
        let defaults = UserDefaults.standard
        defaults.set(savePlayerDifficulty(), forKey: "PlayerDifficulty")
        print(defaults.value(forKey: "PlayerDifficulty") as Any)
    }
    
    func writeSettings() {
        writePlayerName()
        writePlayerCar()
        writePlayerDifficulty()
    }
    
    @IBAction func actionStartRace(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:
                        { self.pointsScreen.alpha = 0
                            self.pointsScreen.transform = CGAffineTransform(scaleX: 2, y: 2)
                        },
                       completion: {_ in self.nextPage()})
        writeSettings()
    }
    
    func animatedScreen() {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations:
                        { self.pointsScreen.alpha = 0.2
                            self.pointsScreen.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        },
                       completion: {_ in self.animatedScreen2()})
    }
    
    func animatedScreen2() {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations:
                        { self.pointsScreen.alpha = 1
                            self.pointsScreen.transform = CGAffineTransform(scaleX: 1, y: 1)
                        },
                       completion: {_ in self.animatedScreen()})
    }
    
    func nextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
        writePlayerName()
    }
}
