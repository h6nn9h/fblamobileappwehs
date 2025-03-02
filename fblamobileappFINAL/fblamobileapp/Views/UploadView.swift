import SwiftUI
import SwiftData

struct UploadView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var questionText = ""
    @State private var correctAnswer = ""
    @State private var wrongAnswer1 = ""
    @State private var wrongAnswer2 = ""
    @State private var wrongAnswer3 = ""
    @State private var selectedEmpire = Empire.romanEmpire
    @State private var selectedCategory = QuestionCategory.culture
    @State private var explanation = ""
    @State private var difficulty = Difficulty.medium
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Empire & Category")) {
                    Picker("Empire", selection: $selectedEmpire) {
                        ForEach(Empire.allCases, id: \.self) { empire in
                            Text(empire.rawValue)
                                .tag(empire)
                        }
                    }
                    Text("Time Period: \(selectedEmpire.timeRange)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(QuestionCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                }
                
                Section(header: Text("Question Details")) {
                    TextField("Question", text: $questionText)
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag(Difficulty.easy)
                        Text("Medium").tag(Difficulty.medium)
                        Text("Hard").tag(Difficulty.hard)
                    }
                }
                
                Section(header: Text("Answers")) {
                    TextField("Correct Answer", text: $correctAnswer)
                    TextField("Wrong Answer 1", text: $wrongAnswer1)
                    TextField("Wrong Answer 2", text: $wrongAnswer2)
                    TextField("Wrong Answer 3", text: $wrongAnswer3)
                }
                
                Section(header: Text("Historical Context")) {
                    TextEditor(text: $explanation)
                        .frame(height: 100)
                }
                
                Button(action: submitQuestion) {
                    Text("Submit Question")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
                .padding()
                .disabled(isFormIncomplete)
            }
            .navigationTitle("Add Empire Question")
            .alert("Success", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Question has been added successfully!")
            }
        }
    }
    
    private var isFormIncomplete: Bool {
        questionText.isEmpty || correctAnswer.isEmpty || 
        wrongAnswer1.isEmpty || wrongAnswer2.isEmpty || wrongAnswer3.isEmpty ||
        explanation.isEmpty
    }
    
    private func submitQuestion() {
        let question = Question(
            questionText: questionText,
            correctAnswer: correctAnswer,
            wrongAnswers: [wrongAnswer1, wrongAnswer2, wrongAnswer3],
            empire: selectedEmpire,
            category: selectedCategory,
            explanation: explanation,
            difficulty: difficulty
        )
        modelContext.insert(question)
        
        // Add some sample questions for testing
        do {
            let existingQuestions = try modelContext.fetch(FetchDescriptor<Question>())
            if existingQuestions.isEmpty {
                addSampleQuestions()
            }
        } catch {
            print("Error checking for existing questions: \(error.localizedDescription)")
        }
        
        // Clear the form
        questionText = ""
        correctAnswer = ""
        wrongAnswer1 = ""
        wrongAnswer2 = ""
        wrongAnswer3 = ""
        explanation = ""
        difficulty = .medium
        
        showAlert = true
    }
    
    private func addSampleQuestions() {
        let sampleQuestions: [(Empire, QuestionCategory, String, String, [String], String)] = [
            (
                .romanEmpire,
                .culture,
                "What language was primarily spoken in the Roman Empire?",
                "Latin",
                ["Greek", "Hebrew", "Egyptian"],
                "Latin was the official language of the Roman Empire and was used for administration, literature, and daily life among Roman citizens. While Greek was also widely spoken in the eastern provinces, Latin remained the primary language of the empire."
            ),
            (
                .mongolEmpire,
                .military,
                "What was the primary military innovation of the Mongol Empire?",
                "Mounted archery",
                ["Infantry tactics", "Naval warfare", "Siege towers"],
                "The Mongol Empire's mounted archers were legendary for their ability to shoot accurately while riding at full gallop, making them one of the most effective military forces in history."
            ),
            // Add more sample questions here
        ]
        
        for (empire, category, question, answer, wrongs, exp) in sampleQuestions {
            let newQuestion = Question(
                questionText: question,
                correctAnswer: answer,
                wrongAnswers: wrongs,
                empire: empire,
                category: category,
                explanation: exp
            )
            modelContext.insert(newQuestion)
        }
    }
} 