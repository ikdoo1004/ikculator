//
//  ViewController.swift
//  ikCulator
//
//  Created by 김익두 on 11/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numOnScreen: Double = 0
    var previousNumber: Double = 0
    var doMath: Bool = false
    var operation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttons(_ sender: UIButton) {
        previousNumber = Double(label.text!)!

        if label.text != "" && sender.tag != 11 && sender.tag != 16 {

            switch sender.tag {
            
            case 12:
                label.text = "/"
                break
            case 13:
                label.text = "x"
                break
            case 14:
                label.text = "-"
                break
            case 15:
                label.text = "+"
                break
            default:
                break
            }

        operation = sender.tag

        doMath = true;

        } else if sender.tag == 16 {
            
            if operation == 12{ //Divide
                
                label.text = String(previousNumber / numOnScreen)
                
            }
            
            else if operation == 13{ //Multiply
                
                label.text = String(previousNumber * numOnScreen)
                
            }
            
            else if operation == 14{ //Subtract
                
                label.text = String(previousNumber - numOnScreen)
                
            }
            
            else if operation == 15{ //Add
                
                label.text = String(previousNumber + numOnScreen)
                
            }
            
            
        }

        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0
            numOnScreen = 0
            operation = 0
        }


    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if doMath {
            label.text = String(sender.tag-1)
            numOnScreen = Double(label.text!)!
            doMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func specialChar(_ sender: UIButton) {
        
    }
    
    
    @IBAction func allClear(_ sender: UIButton) {
        label.text = ""
    }
    
}

