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
    @IBOutlet weak var converterTitle: UILabel!
    @IBOutlet weak var toMetric: UIButton!
    @IBOutlet weak var toImp: UIButton!
    
    var converterLabel : String?
    
    // MARK: Delegate Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempField.placeholder = "Enter a value"
        self.tempResult.textAlignment = .center
        self.tempField.delegate = self
        converterTitle?.text = converterLabel
        switch converterLabel {
            case "Temperature":
                toImp.setTitle("to F", for: .normal)
                toMetric.setTitle("to C", for: .normal)
                break;
            case "Area":
                toImp.setTitle("to Ha", for: .normal)
                toMetric.setTitle("to Ac", for: .normal)
                break;
            case "Length":
                toImp.setTitle("to Ft", for: .normal)
                toMetric.setTitle("to M", for: .normal)
                break;
            case "Weight":
                toImp.setTitle("to Lbs", for: .normal)
                toMetric.setTitle("to Kgs", for: .normal)
                break;
            default:
                toImp.setTitle("Metric > Imp", for: .normal)
                toMetric.setTitle("Imp > Metric", for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tempField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    
    @IBAction func metricToImp(_ sender: Any) {
        // Check if user input String can be converted to Double
        var convertedVal: Double
        if let userVal = Double(self.tempField.text!) {
            // Conversion formula
            switch converterLabel {
                case "Temperature":
                    convertedVal = toF(value: userVal)
                    break;
                case "Area":
                    convertedVal = toHecs(value: userVal)
                    break;
                case "Length":
                    convertedVal = toFeet(value: userVal)
                    break;
                case "Weight":
                    convertedVal = toLbs(value: userVal)
                    break;
                default:
                    convertedVal = 0.0
            }
            // Round the result to at most three decimal places
            let roundConvertedVal = Double(round(1000 * convertedVal) / 1000)
            self.tempResult.text = String(roundConvertedVal)
        } else {
            self.tempResult.text = "N/A"
        }
    }
    
    @IBAction func impToMetric(_ sender: Any) {
        // Check if user input String can be converted to Double
        var convertedVal: Double
        if let userVal = Double(self.tempField.text!) {
            // Conversion formula
            switch converterLabel {
                case "Temperature":
                    convertedVal = toC(value: userVal)
                    break;
                case "Area":
                    convertedVal = toAcres(value: userVal)
                    break;
                case "Length":
                    convertedVal = toMetres(value: userVal)
                    break;
                case "Weight":
                    convertedVal = toKgs(value: userVal)
                    break;
                default:
                    convertedVal = 0.0
            }
            // Round the result to at most three decimal places
            let roundConvertedVal = Double(round(1000 * convertedVal) / 1000)
            self.tempResult.text = String(roundConvertedVal)
        } else {
            self.tempResult.text = "N/A"
        }
    }
    
    func toHecs(value: Double) -> Double {
        return value / 2.4711
    }
    
    func toAcres(value: Double) -> Double {
        return value * 2.4711
    }
    
    func toMetres(value: Double) -> Double {
        return value / 3.2808
    }
    
    func toFeet(value: Double) -> Double {
        return value * 3.2808
    }
    
    func toLbs(value: Double) -> Double {
        return value * 2.2046
    }
    
    func toKgs(value: Double) -> Double {
        return value / 2.2046
    }
    
    func toF(value: Double) -> Double {
        return value * 9.0 / 5.0 + 32.0
    }
    
    func toC(value: Double) -> Double {
        return (value - 32.0) * 5.0 / 9.0
    }
    
}

