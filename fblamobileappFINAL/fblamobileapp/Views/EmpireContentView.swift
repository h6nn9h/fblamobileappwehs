import SwiftUI
import Foundation

struct EmpireContentView: View {
    let empire: Empire
    let category: QuestionCategory
    
    var content: (title: String, text: String) {
        switch (empire, category) {
        case (.romanEmpire, .culture):
            return ("Roman Culture", "The Roman Empire was known for its rich cultural heritage. Latin was the official language, and Roman culture emphasized values like dignity (dignitas), duty (pietas), and honor. The Romans were great patrons of art, literature, and philosophy.")
            
        case (.romanEmpire, .military):
            return ("Roman Military", "The Roman army was one of the most successful military forces in history. They used standardized equipment, professional soldiers, and innovative tactics. The legion was their main military unit, consisting of about 5,000 men.")
            
        case (.mongolEmpire, .military):
            return ("Mongol Military", "The Mongol army was known for its mounted archers and superior mobility. They used sophisticated military tactics and were experts at siege warfare. Their army was organized in units of 10, with the largest being the tumen of 10,000 warriors.")
            
        // Add more content for each empire and category...
        default:
            return ("Coming Soon", "This section is under development. Check back later for more information about \(empire.rawValue)'s \(category.rawValue.lowercased()).")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(content.title)
                .font(.title2)
                .bold()
            
            Text(content.text)
                .font(.body)
            
            // Add relevant images or additional content here
        }
        .padding()
    }
} 