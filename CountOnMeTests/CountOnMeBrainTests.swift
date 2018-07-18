//
//  CountOnMeBrain.swift
//  CountOnMeTests
//
//  Created by Christophe DURAND on 10/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeBrainTests: XCTestCase {
    
    let numberString = CountOnMeBrain()
    
    func testGivenNumberStringIsNil_WhenAddNewNumber_ThenNumberStringIsNotNil() {
        numberString.addNewNumber(1)
        
        XCTAssert(numberString.stringNumbers[numberString.stringNumbers.count-1] == "1")
    }
    
    func testGivenNumberStringIsNotClear_WhenClear_ThenNumberStringIsClear() {
        numberString.clear()
        
        XCTAssert(numberString.stringNumbers[numberString.stringNumbers.count-1] == "")
        XCTAssert(numberString.operators == ["+"])
        XCTAssert(numberString.index == 0)
    }
    
    
}
