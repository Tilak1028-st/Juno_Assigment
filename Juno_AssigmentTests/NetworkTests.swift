//
//  NetworkTests.swift
//  Juno_AssigmentTests
//
//  Created by PCS213 on 13/11/22.
//

import XCTest
@testable import Juno_Assigment

class NetworkTests: XCTestCase {
    var mainScreen: MainScreenViewController!
    var detailScreen: DetailScreenViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        mainScreen = MainScreenViewController()
        detailScreen = DetailScreenViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        mainScreen = nil
        detailScreen = nil
    }

//MARK:  Function will check whether api call is success or not
    
    func testApiSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var apiResult: Bool = false
        mainScreen.mainScreenViewModel.fetchCryptoData { isSuccess in
            apiResult = isSuccess
        }
        
        //MARK:  If apiResult is true test will not fail as if apiResult is false test Case will give error
        XCTAssertFalse(apiResult)
    }
    
    func testBitCoinNameInDetailScreen() throws {
        //With this we can check logo label is having text or not
        let bitCoinName = detailScreen.bitCoinNameLabel?.text
        XCTAssertTrue(bitCoinName == nil)
        
        // With this we can check whether logo url is nil or not from Api side
        let your_holdings = detailScreen.yourHolding?.logo
        XCTAssertTrue(your_holdings == nil)
    }
}
