import Foundation
import SwiftData

enum QuestionCategory: String, Codable, CaseIterable {
    case culture = "Culture"
    case military = "Military"
    case economy = "Economy"
    case politics = "Politics"
    case science = "Science & Technology"
    case religion = "Religion"
    case architecture = "Architecture"
    case daily_life = "Daily Life"
}

@Model
final class Question {
    var questionText: String
    var correctAnswer: String
    var wrongAnswers: [String]
    var empire: Empire
    var category: QuestionCategory
    var explanation: String
    var difficulty: Difficulty
    var timestamp: Date
    
    init(questionText: String,
         correctAnswer: String,
         wrongAnswers: [String],
         empire: Empire,
         category: QuestionCategory,
         explanation: String,
         difficulty: Difficulty = .medium,
         timestamp: Date = Date()) {
        self.questionText = questionText
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
        self.empire = empire
        self.category = category
        self.explanation = explanation
        self.difficulty = difficulty
        self.timestamp = timestamp
    }
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

@Model
final class QuizScore {
    var score: Int
    var totalQuestions: Int
    var empire: Empire
    var difficulty: Difficulty
    var date: Date
    var streakCount: Int
    
    init(score: Int, 
         totalQuestions: Int, 
         empire: Empire,
         difficulty: Difficulty,
         streakCount: Int = 0,
         date: Date = Date()) {
        self.score = score
        self.totalQuestions = totalQuestions
        self.empire = empire
        self.difficulty = difficulty
        self.streakCount = streakCount
        self.date = date
    }
} 