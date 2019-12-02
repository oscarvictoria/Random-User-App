//
//  Random_User_AppTests.swift
//  Random-User-AppTests
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import XCTest
@testable import Random_User_App

class Random_User_AppTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testReadingDataFromRandomUserFile() {
        // Arrange
        let fileName = "randomUsers"
        let ext = "json"
       
        
        // Act
        let data = Bundle.readRawJSONData(fileName: fileName, ext: ext)
        
        // Assert
        XCTAssertNotNil(data)
    }
    
    func testParseJSONDataToUserArray() {
        // arrange
        let fileName = "randomUsers"
        let ext = "json"
        let data = Bundle.readRawJSONData(fileName: fileName, ext: ext)
        
        // act
        let users = RandomUserData.getUsers(from: data)
        
        XCTAssertGreaterThan(users.count, 0)
    }
    
    func testFirstUserNameIsDylan() {
        let fileName = "randomUsers"
        let ext = "json"
        let data = Bundle.readRawJSONData(fileName: fileName, ext: ext)
        let expectedUser = "Dylan"
        let users = RandomUserData.getUsers(from: data)
        
        let firstUser = users.first!
        XCTAssertEqual(firstUser.name.firstName, expectedUser )
        
    }

}
