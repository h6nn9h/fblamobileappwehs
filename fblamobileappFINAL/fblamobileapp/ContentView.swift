//
//  ContentView.swift
//  fblamobileapp
//
//  Created by Hannah You on 2/24/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        TabView {
            ConquerView()
                .tabItem {
                    Label("Conquer", systemImage: "crown.fill")
                }
            
            BattleView()
                .tabItem {
                    Label("Battle", systemImage: "shield.fill")
                }
            
            AchievementsView()
                .tabItem {
                    Label("Legacy", systemImage: "trophy.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Throne", systemImage: "castle.turret.fill")
                }
        }
        .onAppear {
            // Remove question initialization since we're removing quiz functionality
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    // Remove addSampleQuestions() function since it's no longer needed
}

#Preview {
    ContentView()
        .modelContainer(for: UserProfile.self, inMemory: true)
}
