//
//  ViewController.swift
//  Calculate
//
//  Created by Евгений Прохоров on 03.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func digitsTapped(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func OperationTapped(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = numberFromScreen
            if sender.tag == 11 { //Деление
                result.text = "/"
            }
            else if sender.tag == 12 { //Умножение
                result.text = "x"
            }
            else if sender.tag == 13 { //Разность
                result.text = "-"
            }
            else if sender.tag == 14 { //Сложение
                result.text = "+"
            }
            operation = sender.tag
            mathSign = true
        }
        
        else if sender.tag == 15 { //Посчитать
            print(operation, firstNum, numberFromScreen)
            if operation == 11 {
                result.text = String(firstNum / numberFromScreen)
            }
            else if operation == 12 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if operation == 13 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14 {
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
}

