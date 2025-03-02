import SwiftUI
import SwiftData

struct BattleView: View {
    @State private var showTrainingSetup = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Training Section
                Text("Training")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Quick Training Card
                Button(action: {
                    showTrainingSetup = true
                }) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "bolt.fill")
                                .font(.title)
                                .foregroundColor(.yellow)
                            
                            Text("Quick Training")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        
                        Text("Train before going into battle!")
                            .foregroundColor(.primary)
                            .font(.headline)
                        
                        Text("Test your knowledge with multiple choice questions")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(.systemBackground))
                            .shadow(radius: 5)
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
            .navigationTitle("Arena")
            .sheet(isPresented: $showTrainingSetup) {
                TrainingSetupView()
            }
        }
    }
}

// RENAMED to avoid ambiguity and namespace conflicts
enum BattleDifficultyLevel: String, CaseIterable, Identifiable {
    case easy = "Recruit"
    case medium = "Soldier"
    case hard = "Commander"
    case expert = "Emperor"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .easy: return "Basic questions to build your foundation"
        case .medium: return "Intermediate challenges to test your knowledge"
        case .hard: return "Advanced questions for seasoned warriors"
        case .expert: return "Master-level challenges for true emperors"
        }
    }
    
    var iconName: String {
        switch self {
        case .easy: return "1.circle.fill"
        case .medium: return "2.circle.fill"
        case .hard: return "3.circle.fill"
        case .expert: return "crown.fill"
        }
    }
}

// Extracted to separate view component
struct DifficultyRow: View {
    let difficulty: BattleDifficultyLevel
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: difficulty.iconName)
                    .foregroundColor(isSelected ? .blue : .gray)
                
                VStack(alignment: .leading) {
                    Text(difficulty.rawValue)
                        .font(.headline)
                    Text(difficulty.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TrainingSetupView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedEmpires: Set<Empire> = []
    @State private var selectedDifficulty: BattleDifficultyLevel = .easy
    @State private var showTraining = false
    
    // Time options enum for better type safety
    enum TimeOption: Int, CaseIterable, Identifiable {
        case sec10 = 10
        case sec15 = 15
        case sec30 = 30
        case sec45 = 45
        case min1 = 60
        case min1_30 = 90
        case min2 = 120
        
        var id: Int { rawValue }
        
        var displayText: String {
            switch self {
            case .sec10: return "10 sec"
            case .sec15: return "15 sec"
            case .sec30: return "30 sec"
            case .sec45: return "45 sec"
            case .min1: return "1 min"
            case .min1_30: return "1:30"
            case .min2: return "2 min"
            }
        }
    }
    
    @State private var selectedTime: TimeOption = .sec30
    
    var body: some View {
        NavigationView {
            Form {
                // Updated to use renamed difficulty enum
                Section(header: Text("Select Difficulty")) {
                    ForEach(BattleDifficultyLevel.allCases) { difficulty in
                        DifficultyRow(
                            difficulty: difficulty,
                            isSelected: difficulty == selectedDifficulty,
                            action: { selectedDifficulty = difficulty }
                        )
                    }
                }
                
                // Empire Selection
                Section(header: Text("Select Empires")) {
                    ForEach(Empire.allCases, id: \.self) { empire in
                        Toggle(empire.rawValue, isOn: Binding(
                            get: { selectedEmpires.contains(empire) },
                            set: { isSelected in
                                if isSelected {
                                    selectedEmpires.insert(empire)
                                } else {
                                    selectedEmpires.remove(empire)
                                }
                            }
                        ))
                    }
                }
                
                // Add this after the Empire Selection section:
                Section {
                    if selectedEmpires.count < 3 {
                        Text("Please select at least 3 empires")
                            .foregroundColor(.red)
                            .font(.caption)
                    } else {
                        Text("\(selectedEmpires.count) empires selected")
                            .foregroundColor(.green)
                            .font(.caption)
                    }
                }
                
                // Time Selection - Using time enum
                Section(header: Text("Time Limit")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(TimeOption.allCases) { timeOption in
                                TimeButton(
                                    timeOption: timeOption,
                                    isSelected: timeOption == selectedTime,
                                    action: { selectedTime = timeOption }
                                )
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Training Setup")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Start") {
                        showTraining = true
                    }
                    .disabled(selectedEmpires.count < 3)
                }
            }
            .sheet(isPresented: $showTraining) {
                TrainingSessionView(
                    selectedEmpires: Array(selectedEmpires),
                    timeOption: selectedTime.rawValue,
                    difficulty: selectedDifficulty.rawValue
                )
            }
        }
    }
}

// Another extracted component
struct TimeButton: View {
    let timeOption: TrainingSetupView.TimeOption
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(timeOption.displayText)
                .font(.headline)
                .frame(width: 70, height: 60)
                .background(isSelected ? Color.blue.opacity(0.2) : Color(.systemGray6))
                .foregroundColor(isSelected ? .blue : .primary)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
        }
    }
}

// Simple placeholder
struct TrainingSessionPlaceholder: View {
    let empires: [Empire]
    let difficulty: String
    let timeSeconds: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Training Session")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Selected empires: \(empires.map { $0.rawValue }.joined(separator: ", "))")
            Text("Difficulty: \(difficulty)")
            Text("Time: \(timeSeconds) seconds")
            
            Button("Finish") {
                dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
    }
} 