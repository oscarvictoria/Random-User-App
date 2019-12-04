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
    
    let fileName = "randomUsers"
    let ext = "json"

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testReadingDataFromRandomUserFile() {
        // Arrange
//        let fileName = "randomUsers"
//        let ext = "json"


        // Act
        let data = Bundle.readRawJSONData(filename: fileName, ext: ext)

        // Assert
        XCTAssertNotNil(data)
    }
    
    func testParseJSONDataToUserArray() {
        // arrange
//        let fileName = "randomUsers"
//        let ext = "json"
        let data = Bundle.readRawJSONData(filename: fileName, ext: ext)
        
        // act
        let users = RandomUserData.getUsers(from: data)
        
        XCTAssertGreaterThan(users.count, 0)
    }
    
    func testFirstUserNameIsDylan() {
//        let fileName = "randomUsers"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: fileName, ext: ext)
        let expectedUser = "Dylan"
        let users = RandomUserData.getUsers(from: data)
        
        let firstUser = users.first!
        XCTAssertEqual(firstUser.name.firstName, expectedUser )
        
    }
    

    func testUserCountry() {
        // Arrange
        let firstUser = getUsers().first
        let expectedCountry = "United Kingdom"
        // Act
        let country = firstUser?.location.country ?? "Pursuit"
        
        
        
        // Assert
        
        XCTAssertEqual(expectedCountry, country)
    }
    
    func testUserPostCode() {
        let firstUser = getUsers().first
        let expectedPostcode = "V94 6QE"
        
        let postcode = firstUser?.location.postcode.info()
        
        XCTAssertEqual(expectedPostcode, postcode)
    }

}

extension Random_User_AppTests {
    
    func getRawData() -> Data {
        let data = Bundle.readRawJSONData(filename: fileName, ext: ext)
         return data
     }
     
    func getUsers() -> [User] {
        let data = getRawData()
        let users = RandomUserData.getUsers(from: data)
        return users
    }
    
}
