public struct RecordQuery {
    public var table: String
    
    public struct Predicate {
        public var table: String
        public var name: String
        public var comparison: String
        public var value: Codable
    }
    
    public var predicates: [Predicate]
    
    public init(table: String) {
        self.table = table
        self.predicates = []
    }
}
