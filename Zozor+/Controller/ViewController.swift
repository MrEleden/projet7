//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var countOnMeBrain = CountOnMeBrain()
    var isExpressionCorrect: Bool {
        if let stringNumber = countOnMeBrain.stringNumbers.last {
            if stringNumber.isEmpty {
                if countOnMeBrain.stringNumbers.count == 1 {
                    alertStartNewCalculation()
                } else {
                    alertWriteCorrectExpression()
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = countOnMeBrain.stringNumbers.last {
            if stringNumber.isEmpty {
                alertIncorrectExpression()
                return false
            }
        }
        return true
    }
    
    //MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    //MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (index, numberButton) in numberButtons.enumerated() where sender == numberButton {
                countOnMeBrain.addNewNumber(index)
                updateDisplay()
            }
        }

    @IBAction func plus() {
        if canAddOperator {
        	countOnMeBrain.operators.append("+")
        	countOnMeBrain.stringNumbers.append("")
            updateDisplay()
        }
    }

    @IBAction func minus() {
        if canAddOperator {
            countOnMeBrain.operators.append("-")
            countOnMeBrain.stringNumbers.append("")
            updateDisplay()
        }
    }

    @IBAction func multiply() {
        if canAddOperator {
            countOnMeBrain.operators.append("x")
            countOnMeBrain.stringNumbers.append("")
            updateDisplay()
        }
    }
    
    @IBAction func divide() {
        if canAddOperator {
            countOnMeBrain.operators.append("÷")
            countOnMeBrain.stringNumbers.append("")
            updateDisplay()
        }
    }
    
    
    @IBAction func equal() {
        calculateTotal()
    }
    
    //MARK: - Methods
    private func updateDisplay() {
        var text = ""
        for (index, stringNumber) in countOnMeBrain.stringNumbers.enumerated() {
            // Add operator
            if index > 0 {
                text += countOnMeBrain.operators[index]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
    private func calculateTotal() {
        checkingIsExpressionCorrect()
        var total = 0
        for (index, stringNumber) in countOnMeBrain.stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if countOnMeBrain.operators[index] == "+" {
                    total += number
                }
                if countOnMeBrain.operators[index] == "-" {
                    total -= number
                }
                if countOnMeBrain.operators[index] == "x" {
                    total *= number
                }
                if countOnMeBrain.operators[index] == "÷" {
                    total = total / number
                }
            }
        }
        textView.text = textView.text + "=\(total)"
        countOnMeBrain.clear()
    }
    
    private func checkingIsExpressionCorrect() {
        if !isExpressionCorrect {
            return
        }
    }
    
    private func alertStartNewCalculation() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func alertWriteCorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func alertIncorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
