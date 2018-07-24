//
//  CountOnMeBrain.swift
//  CountOnMe
//
//  Created by Christophe DURAND on 09/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

protocol CountOnMeBrainDelegate {
    func updateTextView(text: String)
}


class CountOnMeBrain {
    
    //MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var total = 0
    var countOnMeBrainDelegate: CountOnMeBrainDelegate?
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                   // showAlert(title: "Zéro!", message: "Démarrez un nouveau calcul!")
                } else {
                    //showAlert(title: "Zéro!", message: "Entrez une expression correcte!")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if ((countOnMeBrainDelegate?.updateTextView(text: "\(total)")) != nil) {
       // if textView.text == "\(total)" {
            if let stringNumber = stringNumbers.last {
                if stringNumber.isEmpty {
                   // showAlert(title: "Zéro!", message: "Expression incorrecte!")
                    return false
                }
            }
            updateDisplay()
        }
        return true
    }
    
    //MARK: - Methods
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() {
        for (index, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[index] == "+" {
                    total += number
                } else if operators[index] == "-" {
                    total -= number
                }
            }
        }
        clear()
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
    
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    func plus() {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    func updateDisplay() {
        var text = ""
        for (index, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if index > 0 {
                text += operators[index]
            }
            // Add number
            text += stringNumber
        }
        countOnMeBrainDelegate?.updateTextView(text: text)
       // textView.text = text
    }
}





