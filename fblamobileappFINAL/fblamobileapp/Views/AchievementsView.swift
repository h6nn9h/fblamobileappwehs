import SwiftUI
import SwiftData

struct AchievementsView: View {
    @Query private var scores: [QuizScore]
    @AppStorage("romanEmpireCompleted") private var romanEmpireCompleted = false
    @AppStorage("romanEmpireRead") private var romanEmpireRead = false
    @AppStorage("byzantineEmpireRead") private var byzantineEmpireRead = false
    @AppStorage("mongolEmpireRead") private var mongolEmpireRead = false
    @AppStorage("ottomanEmpireRead") private var ottomanEmpireRead = false
    @AppStorage("persianEmpireRead") private var persianEmpireRead = false
    @AppStorage("egyptianEmpireRead") private var egyptianEmpireRead = false
    @AppStorage("chineseEmpireRead") private var chineseEmpireRead = false
    @AppStorage("aztecEmpireRead") private var aztecEmpireRead = false
    
    var achievements: [Achievement] {
        [
            Achievement(
                title: "History Novice",
                description: "Complete 5 quizzes",
                isUnlocked: scores.count >= 5,
                progress: min(Double(scores.count) / 5.0, 1.0)
            ),
            Achievement(
                title: "Empire Expert",
                description: "Score 100% on a hard difficulty quiz",
                isUnlocked: scores.contains { $0.score == $0.totalQuestions && $0.difficulty == .hard },
                progress: 0.0
            ),
            Achievement(
                title: "Streak Master",
                description: "Achieve a streak of 10",
                isUnlocked: scores.contains { $0.streakCount >= 10 },
                progress: Double(scores.map { $0.streakCount }.max() ?? 0) / 10.0
            ),
            Achievement(
                title: "Roman Scholar",
                description: "Complete the Roman Empire Experience",
                isUnlocked: romanEmpireCompleted,
                progress: romanEmpireCompleted ? 1.0 : 0.0
            ),
            Achievement(
                title: "Empire Historian",
                description: "Complete 3 empire experiences",
                isUnlocked: false,
                progress: romanEmpireCompleted ? 0.33 : 0.0
            ),
            Achievement(
                title: "Master Reader",
                description: "Read about all empires",
                isUnlocked: completedReadingsCount == 8,
                progress: Double(completedReadingsCount) / 8.0
            ),
            Achievement(
                title: "Roman Reader",
                description: "Read about the Roman Empire",
                isUnlocked: romanEmpireRead,
                progress: romanEmpireRead ? 1.0 : 0.0
            )
        ]
    }
    
    var completedReadingsCount: Int {
        [romanEmpireRead, byzantineEmpireRead, mongolEmpireRead, 
         ottomanEmpireRead, persianEmpireRead, egyptianEmpireRead,
         chineseEmpireRead, aztecEmpireRead]
            .filter { $0 }
            .count
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(achievements) { achievement in
                    AchievementRow(achievement: achievement)
                }
            }
            .navigationTitle("Legacy")
        }
    }
}

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let isUnlocked: Bool
    let progress: Double
}

struct AchievementRow: View {
    let achievement: Achievement
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: achievement.isUnlocked ? "trophy.fill" : "trophy")
                    .foregroundColor(achievement.isUnlocked ? .yellow : .gray)
                Text(achievement.title)
                    .font(.headline)
            }
            
            Text(achievement.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ProgressView(value: achievement.progress)
                .tint(achievement.isUnlocked ? .yellow : .blue)
        }
        .padding(.vertical, 8)
    }
} 