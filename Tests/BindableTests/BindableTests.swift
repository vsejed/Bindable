import XCTest
@testable import Bindable

final class BindableTests: XCTestCase {
    func testBindAndFire() {
        // GIVEN
        let property = Bindable("test")
        var result: String = "initial"
        
        // WHEN
        property.bindAndFire { value in
            result = value
        }
        
        // THEN
        XCTAssert(result == "test")
    }
    
    func testBindAndManualFire() {
        // GIVEN
        let property = Bindable("test")
        var result: String = "initial"
        
        // WHEN
        property.bind { value in
            result = value
        }
        
        // THEN
        XCTAssert(result == "initial")
        property.fire()
        XCTAssert(result == "test")
    }
    
    func testBindAndFireWithValue() {
        // GIVEN
        let property = Bindable("test")
        var result: String = "initial"
        
        // WHEN
        property.bind { value in
            result = value
        }
        
        // THEN
        XCTAssert(result == "initial")
        property.fire("value")
        XCTAssert(result == "value")
    }
    
    func testBindAndValueChanged() {
        // GIVEN
        let property = Bindable("test")
        var result: String = "initial"
        
        // WHEN
        property.bind { value in
            result = value
        }
        
        // THEN
        XCTAssert(result == "initial")
        property.value = "new"
        XCTAssert(result == "new")
    }

    static var allTests = [
        ("testBindAndFire", testBindAndFire),
        ("testBindAndManualFire", testBindAndManualFire),
        ("testBindAndFireWithValue", testBindAndFireWithValue),
        ("testBindAndValueChanged", testBindAndValueChanged),
    ]
}
