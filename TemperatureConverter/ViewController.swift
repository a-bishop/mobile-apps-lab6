//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Andrew on 2019-01-18.
//  Copyright © 2019 ICS224. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var tempResult: UILabel!
    
    // MARK: Delegate Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempField.placeholder = "Enter a temperature"
        self.tempResult.textAlignment = .center
        self.tempField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tempField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions

    @IBAction func toF(_ sender: Any) {
        // Check if user input String can be converted to Double
        if let userTemp = Double(self.tempField.text!) {
            // Conversion formula
            let convertedTemp = userTemp * 9.0 / 5.0 + 32.0
            // Round the result to at most three decimal places
            let roundConvertedTemp = Double(round(1000 * convertedTemp) / 1000)
            self.tempResult.text = String(roundConvertedTemp)
        } else {
            self.tempResult.text = "N/A"
        }
    }
    @IBAction func toC(_ sender: Any) {
        // Check if user input String can be converted to Double
        if let userTemp = Double(self.tempField.text!) {
            // Conversion formula
            let convertedTemp = (userTemp - 32.0) * 5.0 / 9.0
            // Round the result to at most three decimal places
            let roundConvertedTemp = Double(round(1000 * convertedTemp) / 1000)
            self.tempResult.text = String(roundConvertedTemp)
        } else {
            self.tempResult.text = "N/A"
        }
    }
    
}

