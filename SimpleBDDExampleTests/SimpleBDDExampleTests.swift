//
//  SimpleBDDExampleTests.swift
//  SimpleBDDExampleTests
//
//  Created by Rajai kumar on 28/01/21.
//

import XCTest
@testable import SimpleBDDExample

var sut: ViewController!

class SimpleBDDExampleTests: XCTestCase {
    
  var sut: ViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
       sut=ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut=nil
        super.tearDown()
    }
    
    func testCalculateValues() {
        //Given
        let a = UITextField()
        a.text = "1"
        let b = UITextField()
        b.text = "2"
        //When
        let answer = sut.calculateValues(withOperator: .addition, inputOne: sut.getIntFromTextfield(inputTextField: a), inputTwo: sut.getIntFromTextfield(inputTextField: b))
        //Then
        XCTAssertEqual(answer, "3", "Details: Input was  1 + 2 and the result should have been 3",file: "ViewController.swift",line: 61)
    }
    
    func testgetIntFromTextfield() {
        //Given
        let a = UITextField()
        a.text = "1"
        //When
        let result = sut.getIntFromTextfield(inputTextField: a)
        //Then
        XCTAssertEqual(result, 1, "Details: Input was  String type -1  and the result should have been Int type -1",file: "ViewController.swift",line: 38)
        
    }
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
