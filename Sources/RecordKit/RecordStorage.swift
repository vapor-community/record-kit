public struct RecordStorage {
    public static let empty: RecordStorage = .init()
    
    var row: RecordRow?
    
    public init() {
        self.row = nil
    }
}
