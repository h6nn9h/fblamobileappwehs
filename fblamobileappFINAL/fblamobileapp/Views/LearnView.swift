import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Empire.allCases, id: \.self) { empire in
                    let detailView = EmpireDetailView(empire: empire)
                    NavigationLink(destination: detailView) {
                        EmpireRowView(empire: empire)
                    }
                }
            }
            .navigationTitle("Historical Empires")
        }
    }
}

struct EmpireRowView: View {
    let empire: Empire
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(empire.rawValue)
                .font(.headline)
            Text(empire.timeRange)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

struct EmpireDetailView: View {
    let empire: Empire
    @State private var selectedCategory: QuestionCategory = .culture
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Time Period Section
                Section {
                    Text("Time Period")
                        .font(.headline)
                    Text(empire.timeRange)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                // Categories Picker
                Picker("Category", selection: $selectedCategory) {
                    ForEach(QuestionCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                // Content based on selected category
                EmpireContentView(empire: empire, category: selectedCategory)
            }
        }
        .navigationTitle(empire.rawValue)
    }
} 