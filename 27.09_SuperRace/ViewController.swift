//
//  ViewController.swift
//  27.09_SuperRace
//
//  Created by Ant Zy on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {
    // полосы движени
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var line1a: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var line2a: UILabel!
    @IBOutlet weak var line3: UILabel!
    @IBOutlet weak var line3a: UILabel!
    @IBOutlet weak var line4: UILabel!
    @IBOutlet weak var line4a: UILabel!
    @IBOutlet weak var line5: UILabel!
    @IBOutlet weak var line5a: UILabel!
    // авто
    @IBOutlet weak var car: UIImageView!
    @IBOutlet weak var whiteCar: UIImageView!
    @IBOutlet weak var grayCar: UIImageView!
    // дорожный знак
    @IBOutlet weak var roadWork: UIImageView!
    // старт игры
    @IBOutlet weak var startButton: UIButton!
    // конец игры
    @IBOutlet weak var gameOverView: UIView!
    @IBOutlet weak var gameOverText: UILabel!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @objc func carsToGo() {
        
        if grayCar.frame.minY < view.frame.height {
            grayCar.frame = CGRect(x: grayCar.frame.minX, y: grayCar.frame.minY + 5, width: grayCar.frame.width, height: grayCar.frame.height)
        } else {
            grayCar.frame = CGRect(x: grayCar.frame.minX, y: 0 -  grayCar.frame.minY, width: grayCar.frame.width, height: grayCar.frame.height)
        }
        
        if roadWork.frame.minY < view.frame.height {
            roadWork.frame = CGRect(x: roadWork.frame.minX, y: roadWork.frame.minY + 2, width: roadWork.frame.width, height: roadWork.frame.height)
        } else {
            roadWork.frame = CGRect(x: roadWork.frame.minX, y: 0 -  roadWork.frame.minY, width: roadWork.frame.width, height: roadWork.frame.height)
        }
        
        if  whiteCar.frame.minY < view.frame.height {
            whiteCar.frame = CGRect(x: whiteCar.frame.minX, y: whiteCar.frame.minY + 7, width: whiteCar.frame.width, height: whiteCar.frame.height)
        } else {
            whiteCar.frame = CGRect(x: whiteCar.frame.minX, y: 0 -  whiteCar.frame.minY, width: whiteCar.frame.width, height: whiteCar.frame.height)
        }
        
        if car.frame.intersects(whiteCar.frame) || car.frame.intersects(grayCar.frame) || car.frame.intersects(roadWork.frame) {
            gameOverView.isHidden = false
            gameOverText.isHidden = false
//            let image = UIImage(named: "carCrash.png")
            car.image = UIImage(named: "carCrash")
            car.frame = CGRect(x: view.frame.width / 2 - car.frame.width / 2, y: view.frame.height / 2 - car.frame.width / 2, width: car.frame.width, height: car.frame.height)
            carCrash()
        }
    }
    //carcrash
    func carCrash() {
        UIView.animate(withDuration: 1) {
            self.car.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
    }
    
    // анимация полос
    func superTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 0.5,
                                         target: self,
                                         selector: #selector(fireTimer),
                                         userInfo: nil,
                                         repeats: true)
        self.timer = timer
    }
    
    func oncomingFlowRight() {
        let timer = Timer.scheduledTimer(timeInterval: 1 / 60,
                                         target: self,
                                         selector: #selector(carsToGo),
                                         userInfo: nil,
                                         repeats: true)
        self.timer = timer
    }
    
    @objc func fireTimer() {
        
        UIView.animate(withDuration: 0.1, delay: 0) {
            self.line1.frame = CGRect(x: self.line1.frame.minX,
                                      y: self.line1.frame.minY + self.line1.frame.height,
                                      width: self.line1.frame.width,
                                      height: self.line1.frame.height)
            
            self.line2.frame = CGRect(x: self.line2.frame.minX,
                                      y: self.line2.frame.minY + self.line2.frame.height,
                                      width: self.line2.frame.width,
                                      height: self.line2.frame.height)
            
            self.line3.frame = CGRect(x: self.line3.frame.minX,
                                      y: self.line3.frame.minY + self.line3.frame.height,
                                      width: self.line3.frame.width,
                                      height: self.line3.frame.height)
            
            self.line4.frame = CGRect(x: self.line4.frame.minX,
                                      y: self.line4.frame.minY + self.line4.frame.height,
                                      width: self.line4.frame.width,
                                      height: self.line4.frame.height)
            
            self.line5.frame = CGRect(x: self.line5.frame.minX,
                                      y: self.line5.frame.minY + self.line5.frame.height,
                                      width: self.line5.frame.width,
                                      height: self.line5.frame.height)
            
            self.line1a.frame = CGRect(x: self.line1a.frame.minX,
                                       y: self.line1a.frame.minY + self.line1a.frame.height,
                                       width: self.line1a.frame.width,
                                       height: self.line1a.frame.height)
            
            self.line2a.frame = CGRect(x: self.line2a.frame.minX,
                                       y: self.line2a.frame.minY + self.line2a.frame.height,
                                       width: self.line2a.frame.width,
                                       height: self.line2a.frame.height)
            
            self.line3a.frame = CGRect(x: self.line3a.frame.minX,
                                       y: self.line3a.frame.minY + self.line3a.frame.height,
                                       width: self.line3a.frame.width,
                                       height: self.line3a.frame.height)
            
            self.line4a.frame = CGRect(x: self.line4a.frame.minX,
                                       y: self.line4a.frame.minY + self.line4a.frame.height,
                                       width: self.line4a.frame.width,
                                       height: self.line4a.frame.height)
            
            self.line5a.frame = CGRect(x: self.line5a.frame.minX,
                                       y: self.line5a.frame.minY + self.line5a.frame.height,
                                       width: self.line5a.frame.width,
                                       height: self.line5a.frame.height)
        }
        
        UIView.animate(withDuration: 0, delay: 0.5) {
            self.line1.frame = CGRect(x: self.line1.frame.minX,
                                      y: self.line1.frame.minY - self.line1.frame.height,
                                      width: self.line1.frame.width,
                                      height: self.line1.frame.height)
            
            self.line2.frame = CGRect(x: self.line2.frame.minX,
                                      y: self.line2.frame.minY - self.line2.frame.height,
                                      width: self.line2.frame.width,
                                      height: self.line2.frame.height)
            
            self.line3.frame = CGRect(x: self.line3.frame.minX,
                                      y: self.line3.frame.minY - self.line3.frame.height,
                                      width: self.line3.frame.width,
                                      height: self.line3.frame.height)
            
            self.line4.frame = CGRect(x: self.line4.frame.minX,
                                      y: self.line4.frame.minY - self.line4.frame.height,
                                      width: self.line4.frame.width,
                                      height: self.line4.frame.height)
            
            self.line5.frame = CGRect(x: self.line5.frame.minX,
                                      y: self.line5.frame.minY - self.line5.frame.height,
                                      width: self.line5.frame.width,
                                      height: self.line5.frame.height)
            
            self.line1a.frame = CGRect(x: self.line1a.frame.minX,
                                       y: self.line1a.frame.minY - self.line1a.frame.height,
                                       width: self.line1a.frame.width,
                                       height: self.line1a.frame.height)
            
            self.line2a.frame = CGRect(x: self.line2a.frame.minX,
                                       y: self.line2a.frame.minY - self.line2a.frame.height,
                                       width: self.line2a.frame.width,
                                       height: self.line2a.frame.height)
            
            self.line3a.frame = CGRect(x: self.line3a.frame.minX,
                                       y: self.line3a.frame.minY - self.line3a.frame.height,
                                       width: self.line3a.frame.width,
                                       height: self.line3a.frame.height)
            
            self.line4a.frame = CGRect(x: self.line4a.frame.minX,
                                       y: self.line4a.frame.minY - self.line4a.frame.height,
                                       width: self.line4a.frame.width,
                                       height: self.line4a.frame.height)
            
            self.line5a.frame = CGRect(x: self.line5a.frame.minX,
                                       y: self.line5a.frame.minY - self.line5a.frame.height,
                                       width: self.line5a.frame.width,
                                       height: self.line5a.frame.height)
        }
    }
    
    @IBAction func actionStartGame(_ sender: Any) {
        superTimer()
        oncomingFlowRight()
        startButton.setTitle("      test", for: .normal)
    }
    
    @IBAction func actiomLeft(_ sender: Any) {
        let carStep: Int = 50
        if car.frame.minX > CGFloat(carStep)  {
            car.frame = CGRect(x: car.frame.minX - CGFloat(carStep), y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        } else {
            car.frame = CGRect(x: 0, y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        }
    }
    
    @IBAction func actionRight(_ sender: Any) {
        let carStep: Int = 50
        if car.frame.maxX < (view.frame.width - CGFloat(carStep)) {
            car.frame = CGRect(x: car.frame.minX + CGFloat(carStep), y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        } else {
            car.frame = CGRect(x: view.frame.width - car.frame.width, y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        }
    }
    
    @IBAction func actionUp(_ sender: Any) {
        let carStep: Int = 50
        car.frame = CGRect(x: car.frame.minX, y: car.frame.minY - CGFloat(carStep), width: car.frame.width, height: car.frame.height)
    }
    
    @IBAction func actionDown(_ sender: Any) {
        let carStep: Int = 50
        car.frame = CGRect(x: car.frame.minX, y: car.frame.minY + CGFloat(carStep), width: car.frame.width, height: car.frame.height)
    }
    
}

