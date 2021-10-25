//
//  ViewController.swift
//  27.09_SuperRace
//
//  Created by Ant Zy on 30.09.2021.
//

import UIKit

class ViewControllerStart: UIViewController {
    
    @IBOutlet weak var screenBreak: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        animatedScreen()
        animatedStartButton()
    }
    
    @IBAction func actionGoToTheGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(identifier: "ViewControllerSettings") as? ViewControllerSettings {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func animatedStartButton() {
        UIButton.animate(withDuration: 0.1, delay: 0.7, options: []) {
                            self.startButton.frame = CGRect(x: self.startButton.frame.minX, y: self.startButton.frame.minY - 100, width: self.startButton.frame.width, height: self.startButton.frame.height)
            
        } completion: {_ in
            UIButton.animate(withDuration: 0.1, delay: 0, options: []) {
                                self.startButton.frame = CGRect(x: self.startButton.frame.minX, y: self.startButton.frame.minY + 100, width: self.startButton.frame.width, height: self.startButton.frame.height)
            }
        }
        
        UIButton.animate(withDuration: 0.2, delay: 0.7){
            self.startButton.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
        
        
    }
    
    func animatedScreen() {
        UIView.animate(withDuration: 2) {
            self.screenBreak.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        animatedScreen2()
    }
    
    func animatedScreen2() {
        UIView.animate(withDuration: 2, delay: 2, options: [], animations: {self.screenBreak.transform = CGAffineTransform(scaleX: 1, y: 1) }, completion: {_ in self.animatedScreen()})
    }
}

extension UIViewController {
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
