//
//  CustomView.swift
//  27.09_SuperRace
//
//  Created by Ant Zy on 25.10.2021.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var myTestLabel: UILabel!
    
    
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Welcome to the Krusty Krab\n Order amount $", message: "Please enter your telephone number to contact with you", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in textField.placeholder = "+375 Belarus"})
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {action in
            if let text = alert.textFields?.first?.text {
                print("call to this number \(text)")}
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("Cansel")}))
        
//        present(alert, animated: true)
    }
    
}
