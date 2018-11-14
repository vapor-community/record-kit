public struct RecordColumn<R, T>
    where R: Record, T: Codable
{
    public let name: String
    internal let record: R
    
    public init(record: R, name: String) {
        self.record = record
        self.name = name
    }
    
    public func get() throws -> T {
        guard let row = self.record.storage.row else {
            fatalError("No storage row")
        }
        return try row.decode(column: self.name, table: R.ref.table)
    }
}

extension Record {
    public typealias Column<T> = RecordColumn<Self, T>
        where T: Codable
    
    public func column<T>(_ name: String) -> Column<T>
        where T: Codable
    {
        return .init(record: self, name: name)
    }
}
