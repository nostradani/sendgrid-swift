//
//  SuppressionListDeleterTests.swift
//  SendGridTests
//
//  Created by Scott Kawai on 9/21/17.
//

import XCTest
@testable import SendGrid

class SuppressionListDeleterTests: XCTestCase {
    
    func testInitialization() {
        let deleteAllOn = SuppressionListDeleter<Bounce>(deleteAll: true, emails: nil)
        XCTAssertTrue(deleteAllOn.parameters!.deleteAll!)
        XCTAssertNil(deleteAllOn.parameters!.emails)
        
        let deleteAllOff = SuppressionListDeleter<Bounce>(deleteAll: false, emails: nil)
        XCTAssertFalse(deleteAllOff.parameters!.deleteAll!)
        XCTAssertNil(deleteAllOff.parameters!.emails)
        
        let emails = SuppressionListDeleter<Bounce>(deleteAll: nil, emails: ["foo@bar.com"])
        XCTAssertNil(emails.parameters!.deleteAll)
        XCTAssertEqual(emails.parameters!.emails?.joined(), "foo@bar.com")
    }
    
}
