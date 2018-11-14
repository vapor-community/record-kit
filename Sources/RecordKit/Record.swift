public protocol Record: class {
    var table: String { get }
    var storage: RecordStorage { get set }
    init(storage: RecordStorage)
}

extension Record {
    internal static var ref: Self {
        return .init(storage: .empty)
    }
}

extension Record {
    public var table: String {
        return "\(Self.self)"
    }
}

open class BaseRecord: Record {
    public var storage: RecordStorage
    
    public required init(storage: RecordStorage) {
        self.storage = storage
    }
}
