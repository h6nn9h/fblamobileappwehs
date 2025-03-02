import SwiftUI
import SwiftData

struct ScoreboardView: View {
    @Query private var scores: [QuizScore]
    @State private var selectedEmpire: Empire?
    @State private var selectedDifficulty = Difficulty.medium
    
    var filteredScores: [QuizScore] {
        scores.filter { score in
            if selectedEmpire == nil {
                return score.difficulty == selectedDifficulty
            }
            return score.difficulty == selectedDifficulty && 
                   score.empire == selectedEmpire
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Empire", selection: $selectedEmpire) {
                        Text("All Empires").tag(nil as Empire?)
                        ForEach(Empire.allCases, id: \.self) { empire in
                            Text(empire.rawValue).tag(empire as Empire?)
                        }
                    }
                    
                    Picker("Difficulty", selection: $selectedDifficulty) {
                        Text("Easy").tag(Difficulty.easy)
                        Text("Medium").tag(Difficulty.medium)
                        Text("Hard").tag(Difficulty.hard)
                    }
                }
                
                Section(header: Text("Recent Scores")) {
                    if filteredScores.isEmpty {
                        Text("No scores yet")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(filteredScores.sorted(by: { $0.date > $1.date })) { result in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(result.date, format: .dateTime)
                                    Spacer()
                                    Text("\(result.score)/\(result.totalQuestions)")
                                        .bold()
                                }
                                Text("Streak: \(result.streakCount)")
                                    .font(.caption)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                }
                
                Section(header: Text("Statistics")) {
                    HStack {
                        Text("Average Score")
                        Spacer()
                        Text(String(format: "%.1f%%", averageScore))
                            .bold()
                    }
                    
                    HStack {
                        Text("Highest Streak")
                        Spacer()
                        Text("\(highestStreak)")
                            .bold()
                            .foregroundColor(.orange)
                    }
                    
                    HStack {
                        Text("Total Quizzes")
                        Spacer()
                        Text("\(filteredScores.count)")
                            .bold()
                    }
                }
            }
            .navigationTitle("History Scores")
        }
    }
    
    var averageScore: Double {
        guard !filteredScores.isEmpty else { return 0 }
        let totalScore = filteredScores.reduce(0) { $0 + Double($1.score) / Double($1.totalQuestions) }
        return (totalScore / Double(filteredScores.count)) * 100
    }
    
    var highestStreak: Int {
        filteredScores.map { $0.streakCount }.max() ?? 0
    }
} 