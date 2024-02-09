//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Александр Кириченко on 02.05.2023.
//

import XCTest
@testable import RandomUsers

final class RandomUsersTests: XCTestCase {
    
    func testSum() {
        XCTAssertTrue(sum(2, 4) == 6)
    }
    
    func testUserModel() throws {
        
        let jsonData = try getTestJSONData()
        do {
            let _ = try JSONDecoder().decode(Responce.self, from: jsonData)
        }
        catch {
            XCTFail("Failed to decode JSON into the model: \(error)")
        }
    }
    
    func getTestJSONData() throws -> Data {
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "randomUsers", withExtension: "json") else {
            fatalError("Missing file: randomUsers.json")
        }
        return try Data(contentsOf: url)
    }

}
