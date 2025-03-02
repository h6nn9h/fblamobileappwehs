import SwiftUI

struct EmpireSlide: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let imageSystemName: String
    let backgroundImage: String
    let interactiveElement: AnyView
}

// Custom slider view component to prevent text opacity issues
struct InteractiveSlider: View {
    let title: String
    let leftEmoji: String
    let rightEmoji: String
    @Binding var value: Double
    let valueLabel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
            
            HStack(spacing: 12) {
                Text(leftEmoji)
                    .font(.subheadline)
                Slider(value: $value, in: 0...100)
                    .tint(.blue)
                Text(rightEmoji)
                    .font(.subheadline)
            }
            
            Text(valueLabel)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}

struct ConfettiView: View {
    @State private var isAnimating = false
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange]
    
    var body: some View {
        ZStack {
            ForEach(0..<50) { index in
                Circle()
                    .fill(colors[index % colors.count])
                    .frame(width: 10, height: 10)
                    .offset(x: isAnimating ? .random(in: -150...150) : 0,
                           y: isAnimating ? .random(in: -200...0) : 0)
                    .opacity(isAnimating ? 0 : 1)
                    .animation(
                        Animation.easeOut(duration: 2)
                            .delay(Double.random(in: 0...0.5))
                            .repeatCount(1),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct StoryText: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .lineSpacing(4)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct EmpireSlideView: View {
    let empire: Empire
    @Environment(\.dismiss) private var dismiss
    @State private var currentSlide = 0
    @State private var showingConfetti = false
    @State private var legacyRating = 0
    
    // Add these AppStorage properties
    @AppStorage("romanEmpireCompleted") private var romanEmpireCompleted = false
    @AppStorage("mongolEmpireCompleted") private var mongolEmpireCompleted = false
    @AppStorage("ottomanEmpireCompleted") private var ottomanEmpireCompleted = false
    
    // State variables for interactive elements
    @State private var legendWordInput = ""
    @State private var selectedClass = ""
    @State private var elephantCount = 0
    @State private var caesarChoices: Set<String> = []
    @State private var resources: [String: Int] = [
        "gold": 0,
        "grain": 0,
        "troops": 0,
        "culture": 0,
        "trade": 0,
        "siege": 0,
        "knowledge": 0
    ]
    @State private var coliseumAttendance = 0
    @State private var empireStatus = ""
    @State private var hasCompletedExperience = false
    @State private var empireStrength = 50.0
    @State private var showAchievement = false
    @State private var isCompleted = false
    
    var slides: [EmpireSlide] {
        switch empire {
        case .mongolEmpire:
            return [
                EmpireSlide(
                    title: "🐎 A Boy's Dream on the Steppes",
                    content: """
                    1162: A young Temujin, future Genghis Khan, faces hardship on the Mongolian steppes. His father murdered, his clan abandoned him. Yet from these harsh beginnings, the greatest empire in history will rise.

                    'Khüch' (хүч) represents strength and power in Mongolian - a force that flows through nature, warriors, and the spirit of the steppes.
                    
                    Build this powerful word...
                    """,
                    imageSystemName: "person.fill",
                    backgroundImage: "mongolemp1",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Tap the letters in order to spell KHÜCH")
                                .font(.headline)
                            
                            HStack(spacing: 12) {
                                ForEach(["K", "Ü", "C", "H"], id: \.self) { letter in
                                    Button(action: {
                                        if legendWordInput.count < 4 {
                                            legendWordInput += letter
                                        }
                                    }) {
                                        Text(letter)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                            }
                            
                            Text(legendWordInput)
                                .font(.title)
                                .padding()
                            
                            Button("Clear") {
                                legendWordInput = ""
                            }
                            .buttonStyle(.bordered)
                            
                            if legendWordInput == "KHÜC" {
                                VStack(spacing: 8) {
                                    Text("You have found the strength of the steppes! 🐎")
                                        .foregroundColor(.green)
                                    Text("'Khüch' symbolizes not just physical strength, but the inner power that drove the Mongols to build history's largest land empire.")
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "⚔️ Blood Brothers of the Steppe",
                    content: """
                    1206: Temujin becomes Genghis Khan! Through brilliant leadership and loyalty, he unites the Mongol tribes. His innovative army organization – the decimal system – will revolutionize warfare.

                    Choose your warriors and build your army!
                    """,
                    imageSystemName: "person.3.fill",
                    backgroundImage: "mongolemp2",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Organize Your Army")
                                .font(.headline)
                            HStack(spacing: 20) {
                                ForEach([
                                    ("🏹", "Archers", "Swift mounted archers, the backbone of your army"),
                                    ("⚔️", "Warriors", "Fierce melee fighters, masters of the sword"),
                                    ("🐎", "Cavalry", "Heavy cavalry for devastating charges")
                                ], id: \.0) { emoji, name, description in
                                    Button(action: { 
                                        selectedClass = name
                                        resources["troops"] = (resources["troops"] ?? 0) + 1000
                                    }) {
                                        VStack {
                                            Text(emoji)
                                                .font(.title)
                                            Text(name)
                                                .font(.caption)
                                        }
                                    }
                                    .buttonStyle(.bordered)
                                    .tint(selectedClass == name ? .blue : .gray)
                                }
                            }
                            
                            if !selectedClass.isEmpty {
                                Text("\(resources["troops"] ?? 0) warriors ready!")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                                Text(selectedClass == "Archers" ? "Your arrows will darken the sky!" :
                                     selectedClass == "Warriors" ? "None can stand against your charge!" :
                                     "The earth trembles beneath their hooves!")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏰 Thunder at the Gates of China",
                    content: """
                    1211: The Jin Dynasty falls! Genghis Khan's engineers master siege warfare, using captured Chinese expertise to build powerful trebuchets. The nomads who once paid tribute now rule the Middle Kingdom.

                    Command your siege weapons!
                    """,
                    imageSystemName: "arrow.right.circle.fill",
                    backgroundImage: "mongolemp3",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Siege Tactics")
                                .font(.headline)
                            HStack(spacing: 20) {
                                ForEach([
                                    ("🎯", "Trebuchet", 0),
                                    ("🔨", "Ram", 0),
                                    ("🪜", "Ladders", 0)
                                ], id: \.0) { emoji, name, _ in
                                    Button(action: {
                                        selectedClass = name
                                        if let current = resources["siege"] {
                                            resources["siege"] = current + 1
                                        } else {
                                            resources["siege"] = 1
                                        }
                                    }) {
                                        VStack {
                                            Text(emoji)
                                                .font(.title)
                                            Text(name)
                                                .font(.caption)
                                        }
                                    }
                                    .buttonStyle(.bordered)
                                    .tint(selectedClass == name ? .blue : .gray)
                                }
                            }
                            
                            if let siegeCount = resources["siege"], siegeCount > 0 {
                                Text("Walls breached: \(siegeCount)")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                                if siegeCount >= 3 {
                                    Text("The city is yours!")
                                        .font(.headline)
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🔥 The Wrath of the Khan",
                    content: """
                    1219: The Shah of Khwarezm executes Mongol traders. Genghis Khan's response? 200,000 warriors descend upon Persia. Cities fall, empires crumble. The greatest conquest in history begins.

                    Lead your armies to victory!
                    """,
                    imageSystemName: "flame.fill",
                    backgroundImage: "mongolemp4",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Command Your Forces")
                                .font(.headline)
                            Text("\(resources["troops"] ?? 0) Warriors")
                                .font(.title2)
                            HStack(spacing: 30) {
                                Button("-50,000") { 
                                    if let troops = resources["troops"], troops >= 50000 {
                                        resources["troops"] = troops - 50000
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Button("+50,000") { 
                                    resources["troops"] = (resources["troops"] ?? 0) + 50000
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            if let troops = resources["troops"] {
                                Text(troops >= 200000 ? "Your army is unstoppable!" :
                                     troops >= 100000 ? "A mighty force gathers!" :
                                     "Keep gathering warriors!")
                                    .foregroundColor(troops >= 200000 ? .green : .blue)
                                    .padding(.top, 8)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🌏 Empire Without Borders",
                    content: """
                    1225: The Pax Mongolica begins! From Korea to Persia, merchants travel safely along the Silk Road. Buddhist monks debate with Muslim scholars, while Chinese innovations spread westward.

                    Build the pillars of Mongol prosperity!
                    """,
                    imageSystemName: "globe.asia.australia.fill",
                    backgroundImage: "mongolemp5",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Develop Trade Routes")
                                .font(.headline)
                            HStack(spacing: 25) {
                                Button(action: {
                                    resources["trade"] = (resources["trade"] ?? 0) + Int.random(in: 5...15)
                                }) {
                                    VStack {
                                        Text("🐫")
                                            .font(.title)
                                        Text("\(resources["trade"] ?? 0)")
                                        Text("Trade")
                                            .font(.caption)
                                    }
                                }
                                
                                Button(action: {
                                    resources["culture"] = (resources["culture"] ?? 0) + Int.random(in: 5...15)
                                }) {
                                    VStack {
                                        Text("🎨")
                                            .font(.title)
                                        Text("\(resources["culture"] ?? 0)")
                                        Text("Culture")
                                            .font(.caption)
                                    }
                                }
                                
                                Button(action: {
                                    resources["knowledge"] = (resources["knowledge"] ?? 0) + Int.random(in: 5...15)
                                }) {
                                    VStack {
                                        Text("📚")
                                            .font(.title)
                                        Text("\(resources["knowledge"] ?? 0)")
                                        Text("Knowledge")
                                            .font(.caption)
                                    }
                                }
                            }
                            
                            let total = resources.values.reduce(0, +)
                            if total > 100 {
                                Text("The Silk Road flourishes under Mongol peace!")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "👑 The Great Khan Falls Silent",
                    content: """
                    1227: Genghis Khan returns to the eternal blue sky. His empire stretches from the Pacific to the Caspian Sea. Four great Khanates emerge, each ruled by his descendants.

                    Choose your successor to the empire!
                    """,
                    imageSystemName: "crown.fill",
                    backgroundImage: "mongolemp6",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Choose the Successor")
                                .font(.headline)
                            HStack(spacing: 20) {
                                ForEach([
                                    ("👑", "Ögedei", "The chosen heir"),
                                    ("⚔️", "Chagatai", "The warrior"),
                                    ("🏹", "Tolui", "The youngest"),
                                    ("🐎", "Jochi", "The firstborn")
                                ], id: \.0) { emoji, name, title in
                                    Button(action: {
                                        selectedClass = name
                                    }) {
                                        VStack {
                                            Text(emoji)
                                                .font(.title)
                                            Text(name)
                                                .font(.caption)
                                        }
                                    }
                                    .buttonStyle(.bordered)
                                    .tint(selectedClass == name ? .blue : .gray)
                                }
                            }
                            
                            if !selectedClass.isEmpty {
                                Text("\(selectedClass) takes the throne!")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                                Text(selectedClass == "Ögedei" ? "The empire remains united" :
                                     selectedClass == "Chagatai" ? "The steppes remain strong" :
                                     selectedClass == "Tolui" ? "China beckons" :
                                     "The west grows distant")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏯 The Dragon Throne",
                    content: """
                    1271: Kublai Khan founds the Yuan Dynasty! From his palace at Xanadu, he rules China as both Khan and Emperor. Marco Polo arrives, amazed by the splendor of the Mongol court.

                    Balance Mongol tradition with Chinese culture!
                    """,
                    imageSystemName: "building.columns.fill",
                    backgroundImage: "mongolemp7",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Rule as Emperor")
                                .font(.headline)
                            InteractiveSlider(
                                title: "Balance Tradition and Innovation",
                                leftEmoji: "🐎",
                                rightEmoji: "🏯",
                                value: $empireStrength,
                                valueLabel: empireStrength < 30 ? "Maintaining Mongol traditions" :
                                          empireStrength > 70 ? "Embracing Chinese customs" :
                                          "Perfect balance achieved!"
                            )
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🌅 Twilight of an Empire",
                    content: """
                    1368: The Yuan Dynasty falls to Chinese rebels. The great Khanates splinter and fade. Yet the Mongol impact on trade, technology, and culture will last centuries.

                    Choose how the empire's story ends...
                    """,
                    imageSystemName: "sunset.fill",
                    backgroundImage: "mongolemp8",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("The Empire's Final Chapter")
                                .font(.headline)
                            
                            VStack(spacing: 20) {
                                ForEach([
                                    ("Return to the Steppes", "The Mongols return to their nomadic roots"),
                                    ("Embrace Chinese Ways", "The Mongols blend into Chinese society"),
                                    ("Fight to the End", "The Mongols resist until the last warrior"),
                                    ("Transform and Adapt", "The empire evolves into new kingdoms")
                                ], id: \.0) { title, description in
                                    Button(action: { empireStatus = title }) {
                                        HStack {
                                            Circle()
                                                .stroke(empireStatus == title ? Color.blue : Color.gray, lineWidth: 2)
                                                .frame(width: 24, height: 24)
                                                .overlay(
                                                    Circle()
                                                        .fill(empireStatus == title ? Color.blue : Color.clear)
                                                        .frame(width: 16, height: 16)
                                                )
                                            
                                            VStack(alignment: .leading) {
                                                Text(title)
                                                    .font(.subheadline)
                                                    .fontWeight(.medium)
                                                Text(description)
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                            Spacer()
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(empireStatus == title ? Color.blue.opacity(0.1) : Color.clear)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(empireStatus == title ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3))
                                        )
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                            
                            if !empireStatus.isEmpty {
                                Text(
                                    empireStatus == "Return to the Steppes" ? "The spirit of the steppes endures..." :
                                    empireStatus == "Embrace Chinese Ways" ? "A new dynasty rises from the ashes..." :
                                    empireStatus == "Fight to the End" ? "Glory to the last warriors!" :
                                    "The legacy lives on in new forms..."
                                )
                                .foregroundColor(.blue)
                                .padding(.top, 8)
                                .font(.headline)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏹 The Legacy of the Great Khan",
                    content: """
                    Though the empire fractured, the Mongol influence forever changed the world.
                    
                    • The Silk Road connected East and West
                    • Gunpowder warfare revolutionized combat
                    • Postal system united vast territories
                    
                    Rate the Mongol Legacy
                    """,
                    imageSystemName: "sunset.fill",
                    backgroundImage: "mongolemp9",
                    interactiveElement: AnyView(
                        VStack(spacing: 20) {
                            // Star Rating
                            HStack(spacing: 15) {
                                ForEach(1...5, id: \.self) { index in
                                    Image(systemName: index <= legacyRating ? "star.fill" : "star")
                                        .font(.title)
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            legacyRating = index
                                            showAchievement = true
                                        }
                                }
                            }
                            .padding(.vertical)
                            
                            // Achievement Card (shows after rating)
                            if showAchievement {
                                VStack(spacing: 16) {
                                    // Trophy and Title
                                    HStack {
                                        Text("🏆")
                                        Text("TENGRI VICTORIOUS!")
                                        Text("🏆")
                                    }
                                    .font(.title2)
                                    .foregroundColor(.yellow)
                                    
                                    // Achievement Text
                                    Text("Achievement Unlocked")
                                        .foregroundColor(.blue)
                                        .fontWeight(.medium)
                                    
                                    Text("Mongol Scholar")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    
                                    Text("Completed the Mongol Empire Experience")
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.center)
                                    
                                    // Completion Button
                                    Button(action: {
                                        if legacyRating > 0 {
                                            handleEmpireCompletion(for: .mongolEmpire)
                                            NotificationCenter.default.post(
                                                name: NSNotification.Name("ShowAchievement"),
                                                object: nil,
                                                userInfo: ["message": "Mongol Empire Achievement Unlocked!"]
                                            )
                                            dismiss()
                                        }
                                    }) {
                                        Text("MONGOL INVICTA!")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.blue, .blue.opacity(0.8)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .cornerRadius(10)
                                    }
                                }
                                .padding(20)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                .padding()
                            }
                        }
                    )
                )
            ]
        case .romanEmpire:
            return [
                EmpireSlide(
                    title: "📜 A City of Legends",
                    content: """
                    753 BCE: The Tiber River flows with destiny. Twin brothers Romulus and Remus, sons of Mars and the Vestal Virgin Rhea Silvia, stand on its banks. Their guardian she-wolf, Lupa, watches from the Palatine Hill – one of Rome's sacred seven hills.

                    Speak the sacred name of the city that will rule the world for centuries to come...
                    """,
                    imageSystemName: "building.columns.fill",
                    backgroundImage: "romanemp1",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Speak the name of the Eternal City")
                                .font(.headline)
                            TextField("Type ROMA", text: $legendWordInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                                .multilineTextAlignment(.center)
                            if legendWordInput.uppercased() == "ROMA" {
                                Text("The city rises! 🏛")
                                    .foregroundColor(.blue)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏛️ The Roman Republic is Born",
                    content: """
                    509 BCE: Lucius Junius Brutus leads the revolution against King Tarquinius Superbus! The Senate, with its 300 members, now guides Rome from their Curia chamber. The first consuls, Brutus and Collatinus, take power.

                    Will you join the wealthy patricians in their marble villas or fight for plebeian rights in the Forum?
                    """,
                    imageSystemName: "building.columns",
                    backgroundImage: "romanemp2",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Choose your social class")
                                .font(.headline)
                            HStack(spacing: 30) {
                                Button(action: { 
                                    selectedClass = "Plebeian"
                                }) {
                                    VStack {
                                        Text("👥")
                                            .font(.title)
                                        Text("Plebeian")
                                    }
                                }
                                .buttonStyle(.bordered)
                                .tint(selectedClass == "Plebeian" ? .blue : .gray)
                                
                                Button(action: { 
                                    selectedClass = "Patrician"
                                }) {
                                    VStack {
                                        Text("👑")
                                            .font(.title)
                                        Text("Patrician")
                                    }
                                }
                                .buttonStyle(.bordered)
                                .tint(selectedClass == "Patrician" ? .blue : .gray)
                            }
                            
                            if selectedClass == "Plebeian" {
                                Text("A common citizen fighting for rights")
                                    .foregroundColor(.blue)
                            } else if selectedClass == "Patrician" {
                                Text("A noble born to privilege")
                                    .foregroundColor(.blue)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "⚔️ Rome vs. Carthage",
                    content: """
                    218 BCE: Hannibal Barca leads 37 war elephants and 50,000 troops across the Alps! The great general Scipio Africanus will soon rise to challenge him. The fate of the Mediterranean hangs in balance.

                    How many of Hannibal's mighty African elephants will survive the treacherous crossing?
                    """,
                    imageSystemName: "mountain.2.fill",
                    backgroundImage: "romanemp3",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Count Hannibal's Elephants")
                                .font(.headline)
                            HStack(spacing: 20) {
                                Button("-") { 
                                    if elephantCount > 0 { 
                                        elephantCount -= 1 
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Text("\(elephantCount) 🐘")
                                    .font(.title2)
                                
                                Button("+") { 
                                    elephantCount += 1 
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "👑 The Rise of Julius Caesar",
                    content: """
                    49 BCE: "Alea iacta est!" Caesar crosses the Rubicon with his loyal 13th Legion. His brilliant campaigns in Gaul (58-50 BCE) and victory over Pompey at Pharsalus (48 BCE) pave his path to power.

                    Which of Caesar's achievements will you claim on your rise to glory?
                    """,
                    imageSystemName: "crown.fill",
                    backgroundImage: "romanemp4",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Select Caesar's Achievements")
                                .font(.headline)
                            HStack(spacing: 20) {
                                ForEach([
                                    ("⚔️", "Conquered Gaul"),
                                    ("🌊", "Crossed Rubicon"),
                                    ("📅", "Reformed Calendar"),
                                    ("🏛️", "Built Forum")
                                ], id: \.0) { symbol, description in
                                    Button(action: {
                                        if caesarChoices.contains(symbol) {
                                            caesarChoices.remove(symbol)
                                        } else {
                                            caesarChoices.insert(symbol)
                                        }
                                    }) {
                                        VStack {
                                            Text(symbol)
                                                .font(.title2)
                                            Text(description)
                                                .font(.caption)
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding(10)
                                        .background(
                                            caesarChoices.contains(symbol) 
                                                ? Color.blue.opacity(0.2) 
                                                : Color.clear
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏛️ The Empire Begins",
                    content: """
                    27 BCE: Octavian becomes Augustus, the first Emperor! After defeating Mark Antony and Cleopatra at Actium (31 BCE), he transforms Rome with marble monuments. The Pax Romana begins, bringing 200 years of peace.

                    Tap to gather the pillars of Roman prosperity!
                    """,
                    imageSystemName: "flag.fill",
                    backgroundImage: "romanemp5",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Build the Glory of Rome")
                                .font(.headline)
                            HStack(spacing: 25) {
                                Button(action: { resources["gold"]! += Int.random(in: 5...15) }) {
                                    VStack {
                                        Text("💰")
                                            .font(.title)
                                        Text("\(resources["gold"]!)")
                                        Text("Treasury")
                                            .font(.caption)
                                    }
                                }
                                
                                Button(action: { resources["grain"]! += Int.random(in: 5...15) }) {
                                    VStack {
                                        Text("🌾")
                                            .font(.title)
                                        Text("\(resources["grain"]!)")
                                        Text("Harvests")
                                            .font(.caption)
                                    }
                                }
                                
                                Button(action: { resources["troops"]! += Int.random(in: 5...15) }) {
                                    VStack {
                                        Text("⚔️")
                                            .font(.title)
                                        Text("\(resources["troops"]!)")
                                        Text("Legions")
                                            .font(.caption)
                                    }
                                }
                                
                                Button(action: { resources["culture"]! += Int.random(in: 5...15) }) {
                                    VStack {
                                        Text("🎭")
                                            .font(.title)
                                        Text("\(resources["culture"]!)")
                                        Text("Arts")
                                            .font(.caption)
                                    }
                                }
                            }
                            if resources.values.reduce(0, +) > 100 {
                                Text("The Empire prospers under your rule!")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                            }
                            
                            // Show prosperity messages based on resource levels
                            if let highestResource = resources.max(by: { $0.value < $1.value })?.key {
                                Text(getProsperityMessage(for: highestResource))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 4)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🌍 Height of Roman Power",
                    content: """
                    80 CE: Emperor Titus inaugurates the Colosseum with 100 days of games! Built by 60,000 Jewish slaves, it stands 48 meters high. The empire stretches from Hadrian's Wall to the Euphrates River.

                    Fill the mighty arena with Rome's citizens!
                    """,
                    imageSystemName: "building.fill",
                    backgroundImage: "romanemp6",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Fill the Colosseum")
                                .font(.headline)
                            Text("\(coliseumAttendance) 👥")
                                .font(.title2)
                            HStack(spacing: 30) {
                                Button("-5000") { 
                                    if coliseumAttendance >= 5000 {
                                        coliseumAttendance -= 5000
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Button("+5000") { 
                                    if coliseumAttendance <= 45000 {
                                        coliseumAttendance += 5000
                                    }
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🔥 The Fall Begins",
                    content: """
                    285 CE: Emperor Diocletian splits the empire in two. The Praetorian Guard sells the throne to the highest bidder. Germanic tribes – Goths, Vandals, and Franks – press at our borders.

                    How will you face these gathering storms?
                    """,
                    imageSystemName: "exclamationmark.triangle.fill",
                    backgroundImage: "romanemp7",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Choose the empire's fate")
                                .font(.headline)
                            HStack(spacing: 20) {
                                Button(action: { empireStatus = "defend" }) {
                                    VStack {
                                        Text("🛡️")
                                            .font(.title)
                                        Text("Defend")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Button(action: { empireStatus = "split" }) {
                                    VStack {
                                        Text("⚔️")
                                            .font(.title)
                                        Text("Split")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Button(action: { empireStatus = "retreat" }) {
                                    VStack {
                                        Text("🏃")
                                            .font(.title)
                                        Text("Retreat")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            if !empireStatus.isEmpty {
                                Text(empireStatus == "defend" ? "Standing firm!" :
                                    empireStatus == "split" ? "Dividing the empire..." :
                                    "Strategic withdrawal...")
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "☠️ The Western Empire Falls",
                    content: """
                    476 CE: The last emperor, 16-year-old Romulus Augustulus, surrenders to Odoacer's Germanic forces. The Western Empire falls after 1,229 years, while Constantinople remains strong in the East.

                    Choose the final fate of Rome's legacy...
                    """,
                    imageSystemName: "clock.fill",
                    backgroundImage: "romanemp8",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Choose the Empire's Final Fate")
                                .font(.headline)
                            HStack(spacing: 20) {
                                Button(action: { empireStatus = "west" }) {
                                    VStack {
                                        Text("🌅")
                                            .font(.title)
                                        Text("Western Fall")
                                            .font(.caption)
                                    }
                                }
                                .buttonStyle(.bordered)
                                
                                Button(action: { empireStatus = "east" }) {
                                    VStack {
                                        Text("🌄")
                                            .font(.title)
                                        Text("Eastern Survival")
                                            .font(.caption)
                                    }
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            if !empireStatus.isEmpty {
                                Text(empireStatus == "west" 
                                    ? "The Western Empire fades into history..."
                                    : "The Eastern Empire endures in Byzantium!")
                                    .foregroundColor(empireStatus == "east" ? .blue : .gray)
                                    .font(.subheadline)
                                    .padding(.top, 8)
                            }
                        }
                    )
                ),
                
                EmpireSlide(
                    title: "🏛️ Rome's Legacy Lives On",
                    content: """
                    Though fallen, Rome's influence shapes our world today.

                    • Latin lives on in modern languages
                    • Roman law guides modern legal systems
                    • Their architecture still inspires us
                    """,
                    imageSystemName: "star.fill",
                    backgroundImage: "romanemp9",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            if showingConfetti {
                                ConfettiView()
                                    .frame(height: 300)
                            }
                            
                            Text("Rate Rome's Legacy")
                                .font(.headline)
                            HStack(spacing: 10) {
                                ForEach(1...5, id: \.self) { star in
                                    Button(action: { 
                                        legacyRating = star
                                        if star > 0 && !romanEmpireCompleted {
                                            withAnimation {
                                                showingConfetti = true
                                            }
                                            romanEmpireCompleted = true
                                        }
                                    }) {
                                        Image(systemName: star <= legacyRating ? "star.fill" : "star")
                                            .foregroundColor(.yellow)
                                            .font(.title2)
                                    }
                                }
                            }
                            .padding(.bottom, 8)
                            
                            if legacyRating > 0 {
                                VStack(spacing: 20) {
                                    Text("🏆 GLORIA VICTIS! 🏆")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.yellow)
                                    
                                    Text("Achievement Unlocked")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    
                                    Text("Roman Scholar")
                                        .font(.title3)
                                        .foregroundColor(.primary)
                                    
                                    Text("Completed the Roman Empire Experience")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Button(action: {
                                        if legacyRating > 0 {
                                            handleEmpireCompletion(for: .romanEmpire)
                                            NotificationCenter.default.post(
                                                name: NSNotification.Name("ShowAchievement"),
                                                object: nil,
                                                userInfo: ["message": "Roman Empire Achievement Unlocked!"]
                                            )
                                            dismiss()
                                        }
                                    }) {
                                        Text("ROMA INVICTA!")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 15)
                                            .background(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.blue, .purple]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(radius: 5)
                                    }
                                    .padding(.top, 10)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(.systemBackground))
                                        .shadow(radius: 10)
                                )
                                .padding()
                            }
                        }
                    )
                )
            ]
        case .ottomanEmpire:
            return [
                // Slide 1: Spell the Word Game
                EmpireSlide(
                    title: "🐎 Rise of the Ottomans",
                    content: """
                    1299: In the heart of Anatolia, a small band of Turkish warriors gathers 
                    around their leader, Osman. Their dream? To build an empire that will 
                    change the world.

                    Choose your path to power...
                    """,
                    imageSystemName: "crown.fill",
                    backgroundImage: "ottomanemp1",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Arrange letters to spell 'ASKER'")
                                .font(.headline)
                            
                            HStack(spacing: 12) {
                                ForEach(["R", "E", "K", "S", "A"], id: \.self) { letter in
                                    Button(action: {
                                        if legendWordInput.count < 5 {
                                            legendWordInput += letter
                                        }
                                    }) {
                                        Text(letter)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                            }
                            
                            Text(legendWordInput)
                                .font(.title)
                                .padding()
                            
                            Button("Clear") {
                                legendWordInput = ""
                            }
                            .buttonStyle(.bordered)
                            
                            if legendWordInput == "ASKER" {
                                Text("You have learned the warrior's way! 🗡️")
                                    .foregroundColor(.green)
                                    .padding(.top)
                            }
                        }
                    )
                ),
                
                // Slide 2: Multiple Toggle Switches
                EmpireSlide(
                    title: "⚔️ The Great Siege",
                    content: """
                    1453: The walls of Constantinople stand before you. Sultan Mehmed's 
                    massive cannons have thundered for 53 days. Today, history will be made.

                    Command the final assault...
                    """,
                    imageSystemName: "shield.fill",
                    backgroundImage: "ottomanemp2",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Coordinate Your Attack")
                                .font(.headline)
                            
                            ForEach([
                                ("🔨", "Deploy Siege Engines"),
                                ("🏹", "Position Archers"),
                                ("⚔️", "Ready Infantry"),
                                ("🐎", "Prepare Cavalry")
                            ], id: \.0) { emoji, name in
                                Toggle(isOn: .init(
                                    get: { resources[name.lowercased()] == 1 },
                                    set: { resources[name.lowercased()] = $0 ? 1 : 0 }
                                )) {
                                    HStack {
                                        Text(emoji)
                                        Text(name)
                                    }
                                }
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(10)
                            }
                            
                            if (resources.filter { $0.value == 1 }.count >= 3) {
                                Text("Your forces are ready for the assault!")
                                    .foregroundColor(.green)
                                    .padding(.top)
                            }
                        }
                    )
                ),
                
                // Slide 3: Suleiman's Glory - Building the Empire's Golden Age
                EmpireSlide(
                    title: "👑 Suleiman's Glory",
                    content: "1520: Under Suleiman the Magnificent, the empire reaches its peak. From Budapest to Baghdad, your influence spans three continents.\n\nBuild your golden age...",
                    imageSystemName: "star.fill",
                    backgroundImage: "ottomanemp3",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Balance the Powers of Empire")
                                .font(.headline)
                                .padding(.bottom, 8)
                            
                            // Draggable sliders with immediate feedback
                            VStack(spacing: 20) {
                                ForEach([
                                    ("⚖️", "Law", "The Kanun Code", [
                                        "Chaos": "Order",
                                        "Tribal Law": "Imperial Law",
                                        "Weak": "Strong"
                                    ]),
                                    ("🕌", "Culture", "Arts & Architecture", [
                                        "Local": "Imperial",
                                        "Simple": "Grand",
                                        "Old": "New"
                                    ]),
                                    ("⚔️", "Military", "Army & Expansion", [
                                        "Defense": "Conquest",
                                        "Small": "Massive",
                                        "Untrained": "Elite"
                                    ])
                                ], id: \.0) { emoji, title, subtitle, labels in
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack {
                                            Text(emoji)
                                            Text(title)
                                                .font(.subheadline)
                                                .fontWeight(.medium)
                                        }
                                        
                                        InteractiveSlider(
                                            title: subtitle,
                                            leftEmoji: "📉",
                                            rightEmoji: "📈",
                                            value: .init(
                                                get: { Double(resources[title.lowercased()] ?? 50) },
                                                set: { resources[title.lowercased()] = Int($0) }
                                            ),
                                            valueLabel: {
                                                let value = resources[title.lowercased()] ?? 50
                                                if value < 33 {
                                                    return labels.keys.first ?? ""
                                                } else if value < 66 {
                                                    return "Balanced"
                                                } else {
                                                    return labels.values.first ?? ""
                                                }
                                            }()
                                        )
                                    }
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(12)
                                    .shadow(radius: 2)
                                }
                            }
                            
                            // Dynamic feedback based on balance
                            if let law = resources["law"],
                               let culture = resources["culture"],
                               let military = resources["military"] {
                                VStack(spacing: 8) {
                                    if law > 75 && culture > 75 && military > 75 {
                                        Text("🌟 The Golden Age Flourishes! 🌟")
                                            .font(.headline)
                                            .foregroundColor(.yellow)
                                    } else if law > 50 && culture > 50 && military > 50 {
                                        Text("The Empire Grows Stronger")
                                            .foregroundColor(.green)
                                    } else if law < 25 || culture < 25 || military < 25 {
                                        Text("The Empire Needs Balance")
                                            .foregroundColor(.orange)
                                    }
                                    
                                    // Achievement messages
                                    if law > 66 {
                                        Text("Laws bring order to the realm")
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                    }
                                    if culture > 66 {
                                        Text("Art and architecture flourish")
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                    }
                                    if military > 66 {
                                        Text("The army stands mighty")
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(.top)
                            }
                        }
                        .padding()
                    )
                ),
                
                // Slide 4: Scrolling Selection Wheel
                EmpireSlide(
                    title: "🏹 Elite Warriors",
                    content: """
                    The Janissaries - your elite guard and most feared warriors. 
                    Taken as Christian boys, trained to perfection, loyal only to you.

                    Train the next generation...
                    """,
                    imageSystemName: "person.3.fill",
                    backgroundImage: "ottomanemp4",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Select Training Focus")
                                .font(.headline)
                            
                            Picker("Training", selection: $selectedClass) {
                                ForEach([
                                    "Musket Corps",
                                    "Artillery Experts",
                                    "Palace Guards",
                                    "Naval Forces",
                                    "Siege Engineers"
                                ], id: \.self) { option in
                                    Text(option).tag(option)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(height: 100)
                            
                            if !selectedClass.isEmpty {
                                Text("The Janissaries will excel in \(selectedClass)!")
                                    .foregroundColor(.blue)
                                    .padding(.top)
                            }
                        }
                    )
                ),
                
                // Slide 5: Interactive Map Points
                EmpireSlide(
                    title: "🌍 A World Power",
                    content: """
                    Your empire spans three continents. 25 million people of different 
                    faiths live under Ottoman rule. The riches of the Silk Road flow 
                    to Istanbul.

                    Secure your trade routes...
                    """,
                    imageSystemName: "globe.europe.africa.fill",
                    backgroundImage: "ottomanemp5",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Tap key trade cities to establish control")
                                .font(.headline)
                            
                            ZStack {
                                // Map background
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.1))
                                    .frame(height: 200)
                                
                                // Istanbul (center point)
                                Text("Istanbul")
                                    .font(.caption)
                                    .position(x: 150, y: 100)
                                
                                // Trade cities
                                ForEach([
                                    ("Venice", CGPoint(x: 50, y: 50)),    // Top left
                                    ("Cairo", CGPoint(x: 150, y: 150)),   // Bottom center
                                    ("Baghdad", CGPoint(x: 250, y: 100))  // Right
                                ], id: \.0) { pair in
                                    let (city, position) = pair
                                    VStack(spacing: 4) {
                                        Circle()
                                            .fill(resources[city.lowercased()] == 1 ? Color.green : Color.red)
                                            .frame(width: 16, height: 16)
                                        Text(city)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .position(x: position.x, y: position.y)
                                    .onTapGesture {
                                        resources[city.lowercased()] = 1
                                    }
                                }
                                
                                // Trade routes (lines connecting cities)
                                Path { path in
                                    // Istanbul to Venice
                                    path.move(to: CGPoint(x: 150, y: 100))
                                    path.addLine(to: CGPoint(x: 50, y: 50))
                                    // Istanbul to Cairo
                                    path.move(to: CGPoint(x: 150, y: 100))
                                    path.addLine(to: CGPoint(x: 150, y: 150))
                                    // Istanbul to Baghdad
                                    path.move(to: CGPoint(x: 150, y: 100))
                                    path.addLine(to: CGPoint(x: 250, y: 100))
                                }
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                            
                            // Success message
                            if resources.filter({ $0.value == 1 }).count >= 3 {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    Text("Trade network established!")
                                        .foregroundColor(.green)
                                        .fontWeight(.medium)
                                }
                                .padding(.top)
                            }
                        }
                    )
                ),
                
                // Slide 6: Vienna
                EmpireSlide(
                    title: "⚔️ Gates of Vienna",
                    content: """
                    1683: Vienna stands as the last barrier to European conquest. 
                    Your massive army surrounds the city, but time runs short. 
                    European reinforcements approach.

                    Make your choice...
                    """,
                    imageSystemName: "exclamationmark.triangle.fill",
                    backgroundImage: "ottomanemp6",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            Text("Choose Your Strategy")
                                .font(.headline)
                            
                            ForEach([
                                ("⚔️", "Attack", "Risk everything"),
                                ("🛡️", "Hold", "Continue siege"),
                                ("🏃‍♂️", "Retreat", "Save the army")
                            ], id: \.0) { emoji, name, description in
                                Button(action: { empireStatus = name }) {
                                    HStack {
                                        Text(emoji)
                                        Text(name)
                                            .fontWeight(.medium)
                                        Spacer()
                                        if empireStatus == name {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding()
                                    .background(empireStatus == name ? Color.blue.opacity(0.1) : Color.clear)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    )
                ),
                
                // Slide 7: Decline
                EmpireSlide(
                    title: "📉 Winds of Change",
                    content: """
                    The 'Sick Man of Europe' struggles. European powers grow stronger, 
                    while corruption weakens from within. The Janissaries resist change.

                    Can you save the empire?
                    """,
                    imageSystemName: "arrow.down.right.circle.fill",
                    backgroundImage: "ottomanemp7",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            ForEach([
                                ("🔄", "Reform", "Modernize army"),
                                ("📚", "Learn", "New knowledge"),
                                ("💰", "Economy", "Fix finances")
                            ], id: \.0) { emoji, name, description in
                                HStack {
                                    Text(emoji)
                                    Text(name)
                                    Spacer()
                                    Button("-") {
                                        resources[name.lowercased()] = (resources[name.lowercased()] ?? 0) - 1
                                    }
                                    Text("\(resources[name.lowercased()] ?? 0)")
                                    Button("+") {
                                        resources[name.lowercased()] = (resources[name.lowercased()] ?? 0) + 1
                                    }
                                }
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(10)
                            }
                        }
                    )
                ),
                
                // Slide 8: World War I
                EmpireSlide(
                    title: "⚔️ The Final Battle",
                    content: """
                    1914: The Great War begins. The Ottoman Empire joins Germany 
                    against Britain, France, and Russia. Centuries of history hang 
                    in the balance.

                    Make your last stand...
                    """,
                    imageSystemName: "flag.fill",
                    backgroundImage: "ottomanemp8",
                    interactiveElement: AnyView(
                        VStack(spacing: 16) {
                            InteractiveSlider(
                                title: "Deploy Forces",
                                leftEmoji: "🏰",
                                rightEmoji: "⚔️",
                                value: $empireStrength,
                                valueLabel: empireStrength > 75 ? "Fighting fiercely!" :
                                          empireStrength > 50 ? "Holding the line" :
                                          "Forces weakening"
                            )
                        }
                    )
                ),
                
                // Slide 9: Legacy
                EmpireSlide(
                    title: "🏛️ Eternal Legacy",
                    content: """
                    Though the empire has passed, its legacy endures. From Istanbul's 
                    grand mosques to the rich tapestry of Middle Eastern culture, 
                    the Ottoman influence lives on.

                    Rate the Ottoman Legacy...
                    """,
                    imageSystemName: "star.fill",
                    backgroundImage: "ottomanemp9",
                    interactiveElement: AnyView(
                        VStack(spacing: 20) {
                            // Star Rating
                            HStack(spacing: 15) {
                                ForEach(1...5, id: \.self) { index in
                                    Image(systemName: index <= legacyRating ? "star.fill" : "star")
                                        .font(.title)
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            legacyRating = index
                                            showAchievement = true
                                        }
                                }
                            }
                            .padding(.vertical)
                            
                            // Achievement Card
                            if showAchievement {
                                VStack(spacing: 16) {
                                    HStack {
                                        Text("🏆")
                                        Text("OSMANLI MUZAFFER!")
                                        Text("🏆")
                                    }
                                    .font(.title2)
                                    .foregroundColor(.yellow)
                                    
                                    Text("Achievement Unlocked")
                                        .foregroundColor(.blue)
                                        .fontWeight(.medium)
                                    
                                    Text("Ottoman Scholar")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    
                                    Text("Completed the Ottoman Empire Experience")
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        if legacyRating > 0 {
                                            handleEmpireCompletion(for: .ottomanEmpire)
                                            NotificationCenter.default.post(
                                                name: NSNotification.Name("ShowAchievement"),
                                                object: nil,
                                                userInfo: ["message": "Ottoman Empire Achievement Unlocked!"]
                                            )
                                            dismiss()
                                        }
                                    }) {
                                        Text("OTTOMAN GLORIA!")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.blue, .blue.opacity(0.8)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            
                                            .cornerRadius(10)
                                    }
                                }
                                .padding(20)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                .padding()
                            }
                        }
                    )
                )
            ]
        default:
            // For all other empires, return a single "Coming Soon" slide
            return [
                EmpireSlide(
                    title: "📚 Interactive Experience Coming Soon",
                    content: """
                    While this empire is available in quizzes and other learning activities, 
                    the interactive experience is still under development.
                    
                    Check back later for an immersive journey through this empire's history!
                    """,
                    imageSystemName: "hourglass",
                    backgroundImage: empire.bannerImage,
                    interactiveElement: AnyView(
                        VStack {
                            Image(systemName: "hammer.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .padding()
                            Text("Under Construction")
                                .font(.headline)
                        }
                    )
                )
            ]
        }
    }

    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $currentSlide) {
                ForEach(Array(slides.enumerated()), id: \.element.id) { index, slide in
                    ScrollView {
                        VStack(spacing: 20) {
                            // Background Image
                            if !slide.backgroundImage.isEmpty {
                                Image(slide.backgroundImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width - 32, height: (geometry.size.width - 32) * 0.6)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(radius: 5)
                            }
                            
                            // Title and Content
                            VStack(alignment: .leading, spacing: 16) {
                                Text(slide.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text(slide.content)
                                    .font(.body)
                                    .lineSpacing(4)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                            
                            // Interactive Element
                            slide.interactiveElement
                                .frame(maxWidth: geometry.size.width - 32)
                                .padding(.top, 8)
                            
                            Spacer(minLength: 20)
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 60)
                    }
                    .overlay(alignment: .bottom) {
                        if index < slides.count - 1 {
                            HStack(spacing: 8) {
                                Image(systemName: "chevron.left")
                                Text("Swipe to continue")
                                Image(systemName: "chevron.right")
                            }
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(.systemBackground).opacity(0),
                                        Color(.systemBackground)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Close") { dismiss() })
    }
    
    // Add this helper function to your view
    private func getProsperityMessage(for resource: String) -> String {
        switch resource {
        case "gold":
            return "The treasury overflows with wealth!"
        case "grain":
            return "Bountiful harvests feed the empire!"
        case "troops":
            return "Mighty legions guard our borders!"
        case "culture":
            return "Art and learning flourish!"
        default:
            return "The empire grows stronger!"
        }
    }
    
    // Add this function to handle completion
    private func handleEmpireCompletion(for empire: Empire) {
        switch empire {
        case .romanEmpire:
            if !romanEmpireCompleted {
                romanEmpireCompleted = true
                NotificationCenter.default.post(
                    name: NSNotification.Name("ShowAchievement"),
                    object: nil,
                    userInfo: ["message": "Roman Empire Achievement Unlocked!"]
                )
            }
        case .mongolEmpire:
            if !mongolEmpireCompleted {
                mongolEmpireCompleted = true
                NotificationCenter.default.post(
                    name: NSNotification.Name("ShowAchievement"),
                    object: nil,
                    userInfo: ["message": "Mongol Empire Achievement Unlocked!"]
                )
            }
        case .ottomanEmpire:
            if !ottomanEmpireCompleted {
                ottomanEmpireCompleted = true
                NotificationCenter.default.post(
                    name: NSNotification.Name("ShowAchievement"),
                    object: nil,
                    userInfo: ["message": "Ottoman Empire Achievement Unlocked!"]
                )
            }
        default:
            break
        }
        
        // Check for Master of Empires achievement
        if romanEmpireCompleted && mongolEmpireCompleted && ottomanEmpireCompleted {
            NotificationCenter.default.post(
                name: NSNotification.Name("ShowAchievement"),
                object: nil,
                userInfo: ["message": "Master of Empires Achievement Unlocked!"]
            )
        }
    }
}

#Preview {
    NavigationView {
        EmpireSlideView(empire: .romanEmpire)
    }
} 
