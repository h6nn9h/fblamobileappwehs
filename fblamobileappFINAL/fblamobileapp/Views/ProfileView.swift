import SwiftUI
import SwiftData
import PhotosUI

struct ProfileView: View {
    @Query private var scores: [QuizScore]
    @Query private var profiles: [UserProfile]
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingImagePicker = false
    @State private var showingEditProfile = false
    @State private var selectedImage: PhotosPickerItem?
    
    var userProfile: UserProfile {
        if let existingProfile = profiles.first {
            return existingProfile
        } else {
            let newProfile = UserProfile()
            modelContext.insert(newProfile)
            return newProfile
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // Profile Header
                Section {
                    VStack(spacing: 16) {
                        // Profile Image
                        ZStack {
                            if let imageData = userProfile.imageData,
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(.gray)
                            }
                            
                            PhotosPicker(selection: $selectedImage, matching: .images) {
                                Image(systemName: "pencil.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                            .position(x: 100, y: 100)
                        }
                        
                        // Welcome Message
                        VStack(spacing: 8) {
                            Text("Welcome,")
                                .font(.title2)
                            Text("\(userProfile.title) \(userProfile.name)")
                                .font(.title)
                                .bold()
                        }
                        
                        Button("Edit Profile") {
                            showingEditProfile = true
                        }
                        .buttonStyle(.bordered)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                
                // Statistics
                Section(header: Text("Your Stats")) {
                    StatRow(title: "Total Quizzes", value: "\(scores.count)")
                    StatRow(title: "Average Score", value: String(format: "%.1f%%", averageScore))
                    StatRow(title: "Highest Streak", value: "\(highestStreak)")
                    StatRow(title: "Favorite Empire", value: favoriteEmpire?.rawValue ?? "None")
                }
                
                // Leaderboard
                Section(header: Text("Royal Leaderboard")) {
                    LeaderboardView(scores: scores)
                }
                
                // Recent Activity
                Section(header: Text("Recent Activity")) {
                    ForEach(scores.sorted(by: { $0.date > $1.date }).prefix(5)) { score in
                        RecentActivityRow(score: score)
                    }
                }
            }
            .navigationTitle("Profile")
            .onChange(of: selectedImage) { _, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self) {
                        userProfile.imageData = data
                    }
                }
            }
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView(profile: userProfile)
            }
        }
    }
    
    private var averageScore: Double {
        guard !scores.isEmpty else { return 0 }
        let totalScore = scores.reduce(0) { $0 + Double($1.score) / Double($1.totalQuestions) }
        return (totalScore / Double(scores.count)) * 100
    }
    
    private var highestStreak: Int {
        scores.map(\.streakCount).max() ?? 0
    }
    
    private var favoriteEmpire: Empire? {
        let empireCounts = scores.reduce(into: [:]) { counts, score in
            counts[score.empire, default: 0] += 1
        }
        return empireCounts.max(by: { $0.value < $1.value })?.key
    }
}

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var profile: UserProfile
    @State private var title = "King"
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Royal Title")) {
                    Picker("Title", selection: $profile.title) {
                        Text("King").tag("King")
                        Text("Queen").tag("Queen")
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Your Name")) {
                    TextField("Enter your name", text: $profile.name)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") { dismiss() }
            )
        }
    }
}

struct LeaderboardView: View {
    let scores: [QuizScore]
    
    var leaderboardEntries: [(name: String, score: Double, quizzes: Int, image: String)] {
        // Example data with system images as placeholders
        [
            ("King Arthur", 95.5, 42, "person.crop.circle.fill.badge.checkmark"),
            ("Queen Elizabeth", 92.3, 38, "person.crop.circle.fill.badge.plus"),
            ("King Richard", 88.7, 31, "person.crop.circle.fill"),
            ("Queen Victoria", 87.2, 28, "person.crop.circle.fill.badge.moon"),
            ("King Henry", 85.9, 25, "person.crop.circle.fill.badge.star")
        ]
    }
    
    var body: some View {
        ForEach(leaderboardEntries.indices, id: \.self) { index in
            let entry = leaderboardEntries[index]
            HStack(spacing: 12) {
                Text("\(index + 1)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .frame(width: 30)
                
                Image(systemName: entry.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.name)
                        .font(.headline)
                    Text("\(entry.quizzes) conquests")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(String(format: "%.1f%%", entry.score))
                    .font(.headline)
                    .foregroundColor(index == 0 ? .yellow : .primary)
            }
            .padding(.vertical, 4)
        }
    }
}

struct StatRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .bold()
        }
    }
}

struct RecentActivityRow: View {
    let score: QuizScore
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(score.empire.rawValue)
                .font(.headline)
            HStack {
                Text("\(score.score)/\(score.totalQuestions)")
                Spacer()
                Text(score.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
} 