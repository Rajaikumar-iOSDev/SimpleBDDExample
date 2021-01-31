//
//  SimpleBDDExampleUITests.swift
//  SimpleBDDExampleUITests
//
//  Created by Rajai kumar on 28/01/21.
//

import XCTest

class SimpleBDDExampleUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }
    func testUIElementsExistence(){
        
        XCTAssertTrue(app.textFields["TF1"].exists)
        XCTAssertTrue(app.textFields["TF2"].exists)
        XCTAssertTrue(app/*@START_MENU_TOKEN@*/.buttons["-"]/*[[".segmentedControls.buttons[\"-\"]",".buttons[\"-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssertTrue(app.buttons["+"].exists)
        XCTAssertTrue(app.buttons["="].exists)

        
    }

    func testAddition(){
        // UI tests must launch the application that they test.
        //Given
        let inputOne = "1"
        let inputTwo = "2"
        let answer = "3"

        //And

        XCUIApplication().buttons["+"].tap()
        
        //When
       let textField1 =  app.textFields["TF1"]
        textField1.tap()
        textField1.typeText(inputOne)
        
        
        let textField2 =  app.textFields["TF2"]
        textField2.tap()
        textField2.typeText(inputTwo)

        app.buttons["="].tap()
        
        let answerLabel = app.staticTexts[answer]
        
        //Then
        XCTAssertTrue(answerLabel.exists,"Details: Input was 1+2 and expecterd answer is 3")
   
  
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testSubtraction(){
        // UI tests must launch the application that they test.
        //Given
        let inputOne = "2"
        let inputTwo = "1"
        let answer = "1"

        //And
        
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["-"]/*[[".segmentedControls.buttons[\"-\"]",".buttons[\"-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        //When
        let textField1 =  app.textFields["TF1"]
         textField1.tap()
         textField1.typeText(inputOne)
         
         
         let textField2 =  app.textFields["TF2"]
         textField2.tap()
         textField2.typeText(inputTwo)
         app.buttons["="].tap()
         let answerLabel = app.staticTexts[answer]
        
        //Then
        XCTAssertTrue(answerLabel.exists,"Details: Input was 2-1 and expecterd answer is 1")
   
  
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

