import Foundation
import RecordKit

final class Galaxy: BaseRecord {
    var id: Column<UUID> {
        return self.column("id")
    }
    
    var name: Column<String> {
        return self.column("name")
    }
}
