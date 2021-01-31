//
//  ViewController.swift
//  SimpleBDDExample
//
//  Created by Rajai kumar on 28/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var inputOne: UITextField!
    
    @IBOutlet weak var inputTwo: UITextField!
    
    private var currentOperator : Operator = .addition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                view.addGestureRecognizer(tap) // Add gesture recognizer to background view
    }
    
    @IBAction func operatorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentOperator = .addition
        case 1:
            currentOperator = .subtraction
            
        default:
            break;
        }
        
    }
    
    func getIntFrom(textField inputTextField: UITextField) -> Int {
        if let input = inputTextField.text {
            if let input = Int(input){
                return input
            } else{
                return 0
            }
            
        }else{
            return 0
        }
    }
    
    @IBAction func performMath(_ sender: Any) {
        
        answerLabel.text = calculateValues(withOperator: currentOperator, inputOne: getIntFrom(textField: inputOne), inputTwo: getIntFrom( textField: inputTwo))
        
        
    }
    
    
    
    func calculateValues(withOperator sign:Operator,inputOne:Int, inputTwo:Int) -> String{
        switch sign {
        case .addition:
            return String(describing:inputOne + inputTwo)
        case .subtraction:
            return String(describing:inputOne - inputTwo)
        default:
            
            break;
        }
        return "Error"
    }
    
    @objc func handleTap() {
          inputTwo.resignFirstResponder() // dismiss keyoard
        inputOne.resignFirstResponder()
      }
    
    enum Operator: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "*"
        case division = "/"
    }
}


