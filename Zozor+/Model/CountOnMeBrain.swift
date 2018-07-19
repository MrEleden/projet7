//
//  CountOnMeBrain.swift
//  CountOnMe
//
//  Created by Christophe DURAND on 09/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class CountOnMeBrain {

    //MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var total = 0
    
    //MARK: - Methods
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
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }

     func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
