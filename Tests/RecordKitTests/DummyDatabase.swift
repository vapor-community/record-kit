final class DummyDatabase: RecordDatabase {
    var rows: [DummyRow] = []
    func execute(_ query: RecordQuery, _ onRow: (RecordRow) -> ()) {
        let rows = self.rows
        self.rows = []
        rows.forEach(onRow)
    }
}

struct DummyRow: RecordRow {
    var data: [String: Any]
    
    func decode<T>(column: String, table: String?) throws -> T where T : Decodable {
        return data[column]! as! T
    }
}
