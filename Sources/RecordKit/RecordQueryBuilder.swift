public final class RecordQueryBuilder<R>
    where R: Record
{
    public let database: RecordDatabase
    public var query: RecordQuery
    
    public init(database: RecordDatabase) {
        self.database = database
        self.query = .init(table: R.ref.table)
    }
    
    public func filter<T>(_ column: KeyPath<R, RecordColumn<R, T>>, _ value: T) -> Self
        where T: Codable
    {
        let predicate = RecordQuery.Predicate.init(
            table: R.ref.table,
            name: R.ref[keyPath: column].name,
            comparison: "=",
            value: value
        )
        self.query.predicates.append(predicate)
        return self
    }
    
    public func all() -> [R] {
        var all: [R] = []
        run { record in
            all.append(record)
        }
        return all
    }
    
    public func run(_ handler: (R) -> ()) {
        self.database.execute(self.query) { row in
            var storage = RecordStorage()
            storage.row = row
            let record = R(storage: storage)
            handler(record)
        }
    }
}

extension RecordDatabase {
    public func record<R>(_ type: R.Type) -> RecordQueryBuilder<R> {
        return RecordQueryBuilder(database: self)
    }
}
