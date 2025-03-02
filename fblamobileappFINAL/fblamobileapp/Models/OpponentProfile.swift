import Foundation

struct OpponentProfile: Identifiable, Hashable {
    let id: UUID
    let name: String
    let title: String
    let imageSystemName: String
    let winRate: Int
    let speciality: Empire
    let description: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: OpponentProfile, rhs: OpponentProfile) -> Bool {
        lhs.id == rhs.id
    }
    
    static let sampleOpponents = [
        OpponentProfile(
            id: UUID(),
            name: "Alexander",
            title: "The Strategist",
            imageSystemName: "person.fill.checkmark",
            winRate: 85,
            speciality: .romanEmpire,
            description: "Master of Roman military tactics"
        ),
        OpponentProfile(
            id: UUID(),
            name: "Cleopatra",
            title: "The Wise",
            imageSystemName: "person.fill.questionmark",
            winRate: 78,
            speciality: .egyptianEmpire,
            description: "Expert in Egyptian history"
        ),
        OpponentProfile(
            id: UUID(),
            name: "Genghis",
            title: "The Conqueror",
            imageSystemName: "person.fill.viewfinder",
            winRate: 92,
            speciality: .mongolEmpire,
            description: "Undefeated in Mongol Empire challenges"
        )
    ]
} 
