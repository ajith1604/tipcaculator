//
//  ViewController.swift
//  tipcalculator
//
//  Created by Ajith Punnakula on 3/13/17.
//
//

import UIKit

class ViewController: UIViewController {
    
    // MARK : variables in UI
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    
    @IBOutlet weak var billPlusTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmount.becomeFirstResponder()
        
        
        //restore from defaults if less than 10 mins old
        let defaults = UserDefaults.standard
        if (defaults.string(forKey:"previousBill") != nil) {
            let thenObj = defaults.object(forKey: "previousbilldate")!
            let then = thenObj as! NSDate
            
            if (NSDate().timeIntervalSinceReferenceDate - then.timeIntervalSinceReferenceDate < 60*10) {
                billAmount.text = defaults.string(forKey:"previousBill")
            }
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            let defaults = UserDefaults.standard
            defaults.set(billAmount.text, forKey: "previousBill")
        defaults.set(NSDate(), forKey: "previousbilldate")
        
    }
    
    
    @IBAction func billChanged(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.20, 0.25]
        let billDouble = NSString(string: billAmount.text!).doubleValue
        
        let tip = (tipPercentages[tipPercentage.selectedSegmentIndex]) * billDouble
        let total1 = billDouble + tip
        
        billPlusTip.text = String(format: "%.2f",total1)
        
        
    }
    
    
 
}

