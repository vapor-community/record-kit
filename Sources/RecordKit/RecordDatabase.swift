public protocol RecordDatabase {
    func execute(_ query: RecordQuery, _ onRow: (RecordRow) -> ())
}

public protocol RecordRow {
    func decode<T>(column: String, table: String?) throws -> T
        where T: Decodable
}

