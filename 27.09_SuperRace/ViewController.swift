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
    @IBOutlet weak var line6: UILabel!
    @IBOutlet weak var line6a: UILabel!
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
    let carStep: Int = 140
    var line: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        putLine66a()
        addLineToArray()
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
    // carcrash
    func carCrash() {
        UIView.animate(withDuration: 1) {
            self.car.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
    }
    
    // анимация полос
    func superTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1 / 60,
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
    
    func putLine66a() {
    
    view.addSubview(line6)
    view.addSubview(line6a)
    line6.frame = CGRect(x: line1.frame.minX, y: 0 - 2 * line1.frame.height, width: line1.frame.width, height: line1.frame.height)

    line6a.frame = CGRect(x: line1a.frame.minX, y: 0 - 2 * line1a.frame.height, width: line1a.frame.width, height: line1a.frame.height)
    }
    
    func addLineToArray() {
        line += [line1, line2, line3, line4, line5, line6, line1a, line2a, line3a, line4a, line5a, line6a]
    }
    
    
    
    @objc func fireTimer() {
        
        //объеденить все лейблы в массив и применить
        line.forEach {
            if $0.frame.minY < view.frame.height {
                $0.frame = CGRect(x: $0.frame.minX, y: $0.frame.minY + 2, width: $0.frame.width, height: $0.frame.height)
            } else {
                $0.frame = CGRect(x: $0.frame.minX, y: 0 - $0.frame.height, width: $0.frame.width, height: $0.frame.height)
            }
        }
    }
    
    @IBAction func actionStartGame(_ sender: Any) {
        superTimer()
        oncomingFlowRight()
        startButton.setTitle(" ", for: .normal)
    }
    
    @IBAction func actiomLeft(_ sender: Any) {

        if car.frame.minX > CGFloat(carStep)  {
            car.frame = CGRect(x: car.frame.minX - CGFloat(carStep), y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        } else {
            car.frame = CGRect(x: 0, y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        }
    }
    
    @IBAction func actionRight(_ sender: Any) {

        if car.frame.maxX < (view.frame.width - CGFloat(carStep)) {
            car.frame = CGRect(x: car.frame.minX + CGFloat(carStep), y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        } else {
            car.frame = CGRect(x: view.frame.width - car.frame.width, y: car.frame.minY, width: car.frame.width, height: car.frame.height)
        }
    }
}

