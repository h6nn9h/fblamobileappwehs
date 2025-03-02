import SwiftUI

struct AchievementNotification: View {
    let message: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(systemName: "trophy.fill")
                    .font(.title2)
                    .foregroundColor(.yellow)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message)
                        .font(.headline)
                    Text("Check Achievements to see your progress!")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding()
            
            Spacer()
        }
        .transition(.move(edge: .top))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}

struct ConquerView: View {
    @State private var quickLearnEmpires: [Empire] = [.romanEmpire, .mongolEmpire, .egyptianEmpire, .persianEmpire]
    @State private var currentPage = 0
    @State private var showingAchievement = false
    @State private var achievementMessage = ""
    
    var interactiveEmpires: [Empire] {
        [.romanEmpire, .mongolEmpire, .ottomanEmpire]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Experience Cards Carousel
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Interactive Experiences")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        TabView(selection: $currentPage) {
                            ForEach(Array(interactiveEmpires.enumerated()), id: \.element) { index, empire in
                                ExperienceCard(empire: empire)
                                    .padding(.horizontal, 20)
                                    .tag(index)
                            }
                        }
                        .frame(height: 320)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .padding(.bottom, 16)
                    
                    // Fun & Entertainment Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Fun & Entertainment")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(quickLearnEmpires, id: \.self) { empire in
                                    FunActivityCard(empire: empire)
                                        .frame(width: 160)
                                        .padding(.vertical, 8)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 4)
                    }
                    .padding(.bottom, 32)
                    
                    // All Empires Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("All Empires")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ForEach(Empire.allCases, id: \.self) { empire in
                                EmpireFeedCard(empire: empire)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("Conquer")
        }
        .overlay(alignment: .top) {
            if showingAchievement {
                AchievementNotification(
                    message: achievementMessage,
                    isPresented: $showingAchievement
                )
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("ShowAchievement"))) { notification in
            if let message = notification.userInfo?["message"] as? String {
                achievementMessage = message
                withAnimation(.spring()) {
                    showingAchievement = true
                }
            }
        }
    }
}

// Experience Card
struct ExperienceCard: View {
    let empire: Empire
    @State private var isShowingExperience = false
    
    var backgroundImage: String {
        switch empire {
        case .romanEmpire: return "romanemp1"
        case .mongolEmpire: return "mongolemp2"
        case .ottomanEmpire: return "ottomanemp3"
        default: return ""
        }
    }
    
    var body: some View {
        ZStack {
            // Background with image
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .frame(width: 340, height: 260)
                .clipped()
                .cornerRadius(20)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.5),
                            Color.black.opacity(0.2),
                            Color.clear
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            
            VStack(spacing: 20) {
                VStack(spacing: 12) {
                    Text("Experience")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(empire.rawValue)
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Text(empire.timeRange)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Button(action: { isShowingExperience = true }) {
                        Text("Start Experience")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        .fullScreenCover(isPresented: $isShowingExperience) {
            NavigationView {
                EmpireSlideView(empire: empire)
            }
        }
    }
}

// Fun Activity Card
struct FunActivityCard: View {
    let empire: Empire
    
    var body: some View {
        NavigationLink(destination: EmpireDetailView(empire: empire)) {
            VStack(alignment: .leading, spacing: 12) {
                ZStack {
                    Rectangle()
                        .fill(Color.purple.opacity(0.1))
                        .frame(height: 100)
                    
                    Image(systemName: "gamecontroller.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.purple)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Play & Learn")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(empire.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Empire Feed Card
struct EmpireFeedCard: View {
    let empire: Empire
    
    var body: some View {
        NavigationLink(destination: EmpireReadingView(empire: empire)) {
            VStack(alignment: .leading, spacing: 8) {
                Text(empire.rawValue)
                    .font(.headline)
                Text(empire.timeRange)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ConquerView()
} 