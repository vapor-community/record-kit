import XCTest
@testable import RecordKit

final class RecordKitTests: XCTestCase {
    var db: DummyDatabase!
    
    override func setUp() {
        self.db = .init()
    }
    
    func testExample() throws {
        self.db.rows = [
            DummyRow(data: ["name": "Milky Way"])
        ]
        let galaxies = db.record(Galaxy.self).filter(\.name, "Milky Way").all()
        for galaxy in galaxies {
            try XCTAssertEqual(galaxy.name.get(), "Milky Way")
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
