import SwiftUI
import SwiftData

@Model
final class UserProfile {
    var name: String
    var title: String // "King" or "Queen"
    var imageData: Data?
    var dateJoined: Date
    
    init(name: String = "", 
         title: String = "King",
         imageData: Data? = nil,
         dateJoined: Date = Date()) {
        self.name = name
        self.title = title
        self.imageData = imageData
        self.dateJoined = dateJoined
    }
} 