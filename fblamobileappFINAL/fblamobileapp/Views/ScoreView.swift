import SwiftUI

struct ScoreView: View {
    let score: Int
    let total: Int
    let empire: Empire
    @Environment(\.dismiss) private var dismiss
    
    var percentage: Double {
        Double(score) / Double(total) * 100
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Conquest Complete!")
                    .font(.title)
                    .bold()
                
                Text("\(empire.rawValue)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("\(score) out of \(total)")
                    .font(.title2)
                
                Text(String(format: "%.1f%%", percentage))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(percentage >= 70 ? .green : .orange)
                
                if percentage >= 70 {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                        .padding()
                }
                
                Button("Continue Conquering") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .padding()
            .navigationBarItems(trailing: Button("Close") {
                dismiss()
            })
        }
    }
} 