import SwiftUI

struct EmpireReadingView: View {
    let empire: Empire
    @Environment(\.dismiss) private var dismiss
    @AppStorage("romanEmpireRead") private var romanEmpireRead = false
    @AppStorage("byzantineEmpireRead") private var byzantineEmpireRead = false
    @AppStorage("mongolEmpireRead") private var mongolEmpireRead = false
    @AppStorage("ottomanEmpireRead") private var ottomanEmpireRead = false
    @AppStorage("persianEmpireRead") private var persianEmpireRead = false
    @AppStorage("egyptianEmpireRead") private var egyptianEmpireRead = false
    @AppStorage("chineseEmpireRead") private var chineseEmpireRead = false
    @AppStorage("aztecEmpireRead") private var aztecEmpireRead = false
    
    var empireContent: (title: String, content: String) {
        switch empire {
        case .romanEmpire:
            return ("📜 The Roman Empire",
                   """
                   I. Origins & Republic (753–27 BCE)
                   • Legendary Founding (753 BCE): Romulus & Remus; Rome ruled by Etruscan kings
                   • Republic Established (509 BCE): Overthrew monarchy, created a Senate & Consuls
                   • Twelve Tables (451 BCE): First written laws, protected citizens' rights
                   • Punic Wars (264–146 BCE): Rome defeated Carthage, becoming Mediterranean's dominant power

                   II. Fall of the Republic (133–27 BCE)
                   • Social unrest from economic inequality
                   • Julius Caesar (100–44 BCE): Conquered Gaul, declared Dictator for Life but assassinated in 44 BCE
                   • Augustus (Octavian) (27 BCE): Defeated rivals, became Rome's first emperor, ending the Republic

                   III. The Roman Empire & Pax Romana (27 BCE–180 CE)
                   • Pax Romana (27 BCE–180 CE): 200 years of peace, trade, and stability
                   • Achievements: Roads, aqueducts, Colosseum, Latin language, Greco-Roman culture
                   • Christianity Spread (1st century CE): Persecuted until Constantine legalized it (313 CE)

                   IV. Decline & Fall of Rome (180–476 CE)
                   • Political Instability: Corrupt rulers, civil wars
                   • Economic Problems: Inflation, reliance on slave labor, declining trade
                   • Military Weakness: Hired mercenaries, barbarian invasions
                   • 476 CE: Western Rome fell to Germanic tribes; Eastern Rome (Byzantine Empire) survived

                   V. Rome's Lasting Legacy
                   • Law & Government: Basis for modern democracy, legal codes
                   • Architecture: Arches, domes, roads, aqueducts
                   • Language: Latin influenced Spanish, French, English
                   • Christianity: Became the world's largest religion

                   📚 Quick Quiz:
                   1. What caused the fall of the Roman Republic?
                   2. What was the Pax Romana?
                   3. How did Christianity spread in the Roman Empire?
                   4. What factors led to the fall of the Western Roman Empire?
                   5. How did Rome influence modern law and architecture?
                   """)
            
        case .byzantineEmpire:
            return ("📜 The Byzantine Empire",
                   """
                   I. Origins & Early Byzantine Empire (330–527 CE)
                   • Eastern Roman Empire: Founded when Constantine I moved the capital from Rome to Byzantium (renamed Constantinople) in 330 CE
                   • Why It Survived: Strong economy, trade routes, defensive walls
                   • Christianity Strengthened: Council of Nicaea (325 CE) unified doctrine

                   II. The Reign of Justinian I (527–565 CE)
                   • Justinian's Code (Corpus Juris Civilis): Organized Roman laws, basis for modern law
                   • Hagia Sophia: Massive church, symbol of Byzantine power
                   • Expansion: Briefly reconquered parts of Italy, North Africa, and Spain
                   • Theodora: Empress who influenced laws, women's rights
                   • Nika Revolt (532 CE): Justinian brutally crushed an uprising in Constantinople

                   III. Byzantine Society & Culture
                   • Greek-speaking (unlike Latin-speaking Western Rome)
                   • Orthodox Christianity: Split from Catholic Church in 1054 (The Great Schism)
                   • Trade & Economy: Controlled key routes, Silk Road, used gold solidus currency
                   • Art & Icons: Mosaics, domes, and religious paintings

                   IV. Decline of the Empire (11th–15th Century)
                   • Crusades (1096–1204 CE): Initially helped Byzantines but later sacked Constantinople in 1204
                   • Ottoman Threat: Lost territory to Turks
                   • Fall of Constantinople (1453 CE): Ottoman Sultan Mehmed II conquered the city, renaming it Istanbul

                   V. Byzantine Legacy
                   • Preserved Greek & Roman knowledge during the Middle Ages
                   • Justinian's Code influenced modern European law
                   • Eastern Orthodox Christianity spread to Russia and Eastern Europe
                   • Cyrillic Alphabet: Created for Slavic languages (still used today)

                   📚 Quick Quiz:
                   1. What was Justinian's Code, and why was it important?
                   2. What was the significance of the Hagia Sophia?
                   3. What was the Great Schism of 1054?
                   4. How did the Crusades impact the Byzantine Empire?
                   5. What led to the fall of Constantinople in 1453?
                   """)
            
        case .mongolEmpire:
            return ("🏹 The Mongol Empire",
                   """
                   I. Origins & Rise of Genghis Khan (1162–1227 CE)
                   • Nomadic Mongols lived in Central Asian steppes, organized into rival clans
                   • Genghis Khan (Temujin) united the Mongols in 1206, creating the largest land empire in history
                   • Military Tactics:
                       - Expert horse archers, hit-and-run attacks, feigned retreats
                       - Used psychological warfare and terror to force cities to surrender
                   • Conquests:
                       - Defeated Jin Dynasty (China), Khwarezm Empire (Persia)
                       - Conquered Abbasid Caliphate (Middle East), Kievan Rus (Russia)

                   II. Mongol Rule & Administration (1227–1368 CE)
                   • After Genghis Khan's Death (1227): The empire divided into four khanates:
                       - Golden Horde (Russia)
                       - Ilkhanate (Persia)
                       - Chagatai Khanate (Central Asia)
                       - Yuan Dynasty (China, under Kublai Khan)
                   • Religious Tolerance: Allowed Islam, Christianity, Buddhism
                   • Trade & Silk Road:
                       - Pax Mongolica (13th–14th century): Mongols secured trade routes
                       - Ideas, goods, and the Black Death (plague) spread
                   • Postal System (Yam Network): Fast communication using relay stations

                   III. Mongols in China – The Yuan Dynasty (1271–1368 CE)
                   • Kublai Khan conquered Song China and established the Yuan Dynasty
                   • Maintained Chinese bureaucracy but excluded Chinese from top positions
                   • Marco Polo (1275 CE): Venetian traveler who described Mongol China
                   • Decline:
                       - Chinese resented Mongol rule; overthrown by Ming Dynasty in 1368

                   IV. Mongol Decline & Legacy
                   • Too large to govern: Internal rebellion, weak rulers, and civil wars
                   • Golden Horde declined in Russia after Ivan III refused tribute (1480)
                   • Lasting Impacts:
                       - Cultural exchange between Asia and Europe
                       - Russia's isolation from Western Europe
                       - Trade expansion & diffusion of technology

                   📚 Quick Quiz:
                   1. How did Genghis Khan unify the Mongols?
                   2. What was the Pax Mongolica, and why was it important?
                   3. How did the Mongols rule China under the Yuan Dynasty?
                   4. What were the long-term effects of Mongol rule on Russia?
                   5. Why did the Mongol Empire decline?
                   """)
            
        case .ottomanEmpire:
            return ("🕌 The Ottoman Empire",
                   """
                   I. Origins & Early Expansion (1299–1453)
                   • Founded by Osman I (1299 CE) in Anatolia (modern Turkey)
                   • Expanded by ghazi warriors (Islamic fighters)
                   • Conquered Byzantine lands, culminating in:

                   Fall of Constantinople (1453 CE)
                   • Led by Sultan Mehmed II ("The Conqueror")
                   • Used massive cannons to breach the city's walls
                   • Renamed Istanbul, made it the Ottoman capital
                   • Hagia Sophia converted into a mosque

                   II. The Golden Age – Suleiman the Magnificent (1520–1566)
                   • Expanded into Hungary, North Africa, Middle East
                   • Janissaries: Elite slave soldiers from Christian families via the Devshirme System
                   • Legal reforms: Created a fair legal system
                   • Built mosques, palaces, and public works, including Süleymaniye Mosque

                   III. Government & Society
                   • Millet System: Allowed religious minorities (Christians, Jews) self-governance
                   • Trade & Economy: Controlled Silk Road & Mediterranean routes
                   • Cultural Flourishing: Calligraphy, textiles, coffeehouses

                   IV. Decline of the Empire (17th–19th Century)
                   • Siege of Vienna (1683 CE): Failed Ottoman expansion into Europe
                   • Corruption & weak sultans weakened central power
                   • Janissaries resisted military modernization
                   • European rivals (Britain, Russia) grew stronger
                   • Called the "Sick Man of Europe" by the 1800s

                   V. Fall of the Ottoman Empire (1914–1922)
                   • Joined Central Powers in WWI (1914)
                   • Defeated in 1918, lost Arab lands to Britain & France
                   • Abolished in 1922, replaced by modern Turkey under Mustafa Kemal Atatürk

                   VI. Legacy of the Ottomans
                   • Architectural wonders: Blue Mosque, Topkapi Palace
                   • Laws & government systems influenced Middle Eastern states
                   • Cultural influence: Turkish coffee, Islamic art, literature

                   📚 Quick Quiz:
                   1. How did Mehmed II conquer Constantinople in 1453?
                   2. What was the role of the Janissaries in the Ottoman military?
                   3. What was the Millet System, and how did it impact religious minorities?
                   4. Why was the Ottoman Empire called the "Sick Man of Europe"?
                   5. What led to the collapse of the Ottoman Empire after World War I?
                   """)
            
        case .persianEmpire:
            return ("🏺 The Persian Empire",
                   """
                   I. The Achaemenid Empire (550–330 BCE)

                   📖 Founded by Cyrus the Great, the first Persian Empire became one of the largest in history.
                   • Cyrus the Great (r. 559–530 BCE):
                       - Conquered Babylon, Lydia, and Media, forming the first Persian Empire
                       - Religious tolerance: Allowed Jews to return to Jerusalem
                   • Darius I (r. 522–486 BCE):
                       - Divided empire into satrapies (provinces), ruled by satraps (governors)
                       - Built the Royal Road (1,500 miles) for trade and communication
                       - Created a common currency and postal system
                   • Xerxes I (r. 486–465 BCE):
                       - Invaded Greece during the Persian Wars, but was defeated at Salamis (480 BCE)

                   II. Persian Wars & Decline (499–330 BCE)
                   • Persian Wars (499–449 BCE):
                       - Persia vs. Greek city-states (Athens & Sparta)
                       - Defeated at Marathon (490 BCE), Thermopylae (480 BCE), and Salamis (480 BCE)
                   • Fall of the Achaemenids (330 BCE):
                       - Alexander the Great invaded Persia and defeated Darius III
                       - Persepolis was burned, marking the empire's collapse

                   III. The Sassanian Empire (224–651 CE)

                   📖 A Persian revival under the Sassanians, rivaling the Roman and Byzantine Empires.
                   • Zoroastrianism became the state religion
                   • Wars with Rome & Byzantium weakened the empire
                   • Arab Muslim armies conquered Persia in 651 CE, ending Sassanian rule

                   IV. Persian Legacy
                   • Zoroastrianism: Influenced later religions (Judaism, Christianity, Islam)
                   • Infrastructure: Roads, postal system, qanats (underground irrigation)
                   • Cultural Influence: Persian art, poetry (e.g., Rumi, Ferdowsi), architecture

                   📚 Quick Quiz:
                   1. How did Cyrus the Great govern conquered peoples?
                   2. What was the significance of the Royal Road?
                   3. What were the causes and outcomes of the Persian Wars?
                   4. How did Alexander the Great defeat the Persian Empire?
                   5. What role did Zoroastrianism play in Persian society?
                   """)
            
        case .egyptianEmpire:
            return ("🏺 The Egyptian Empire",
                   """
                   I. Early Egypt & Unification (c. 3100 BCE)

                   📖 Ancient Egypt developed along the Nile River, which provided fertile land and transportation.
                   • Unification (c. 3100 BCE): Pharaoh Narmer (Menes) united Upper & Lower Egypt
                   • Pharaohs: Considered living gods, ruled with absolute power
                   • Hieroglyphics: Early writing system used for religious texts & record-keeping

                   II. The Old Kingdom (c. 2686–2181 BCE)

                   📖 The Age of the Pyramids
                   • Built Great Pyramid of Giza (c. 2580 BCE) for Pharaoh Khufu
                   • Bureaucracy developed, with viziers managing tax collection & irrigation projects
                   • Collapsed due to famine, weak leadership, and civil wars

                   III. The Middle Kingdom (c. 2040–1640 BCE)

                   📖 Expansion & Rebuilding
                   • Expanded trade with Nubia and the Near East
                   • Built canals & irrigation to improve agriculture
                   • Hyksos Invasion (c. 1650 BCE): Foreign rulers took control using chariots and bronze weapons

                   IV. The New Kingdom (c. 1550–1070 BCE)

                   📖 Egypt became a powerful empire, conquering parts of Nubia and the Middle East.
                   • Ahmose I expelled the Hyksos and expanded Egypt's borders
                   • Hatshepsut (r. 1479–1458 BCE): First female pharaoh, encouraged trade with Punt
                   • Ramses II (r. 1279–1213 BCE):
                       - Fought the Hittites at the Battle of Kadesh (c. 1274 BCE)
                       - Signed the first known peace treaty
                       - Built massive temples (Abu Simbel)

                   V. Egyptian Religion & Culture
                   • Polytheistic: Worshiped gods like Ra (sun god), Osiris (afterlife), and Anubis (mummification)
                   • Mummification: Preserved bodies for the afterlife
                   • Book of the Dead: Guide for the soul's journey after death

                   VI. Decline & Foreign Rule (c. 1070 BCE – 30 BCE)
                   • Late Period (c. 1070–332 BCE): Weakened by internal strife and foreign invasions
                   • Persian Conquest (525 BCE): Egypt became part of the Persian Empire
                   • Alexander the Great (332 BCE): Conquered Egypt, founded Alexandria
                   • Ptolemaic Rule (323–30 BCE): Greek rulers, ending with Cleopatra VII
                   • Roman Conquest (30 BCE): Egypt became a Roman province after Cleopatra's defeat

                   VII. Egyptian Legacy
                   • Architecture: Pyramids, temples, obelisks
                   • Mathematics & Medicine: Early algebra, surgical tools
                   • Writing: Hieroglyphics influenced later scripts
                   • Cultural Impact: Egyptian art, myths, and symbols remain influential

                   📚 Quick Quiz:
                   1. What role did the Nile River play in Egypt's success?
                   2. How did Pharaohs maintain power in Egyptian society?
                   3. What were the major achievements of the New Kingdom?
                   4. How did Egypt interact with foreign powers like the Hittites and Greeks?
                   5. What led to the decline of ancient Egypt?
                   """)
            
        case .chineseEmpire:
            return ("🏯 The Chinese Empire",
                   """
                   I. Early Dynasties & Foundations (c. 1600 BCE – 220 CE)

                   Shang Dynasty (c. 1600–1046 BCE)

                   📖 First recorded dynasty, developed along the Yellow River.
                   • Oracle bones: Earliest form of Chinese writing
                   • Bronze weapons & chariots used in warfare
                   • Ancestor worship & mandate-based kingship

                   Zhou Dynasty (1046–256 BCE)

                   📖 Introduced the Mandate of Heaven—rulers were divinely chosen but could be overthrown.
                   • Feudal system: Land controlled by local lords
                   • Iron weapons & irrigation improved agriculture
                   • Confucianism & Daoism emerged

                   II. Imperial China (221 BCE – 220 CE)

                   Qin Dynasty (221–206 BCE)

                   📖 First centralized empire of China.
                   • Qin Shi Huangdi unified China after the Warring States Period
                   • Legalism: Strict laws & harsh punishments
                   • Built the first Great Wall & standardized currency, writing, and weights
                   • Terracotta Army built for Qin's tomb

                   Han Dynasty (206 BCE – 220 CE)

                   📖 Golden Age of China—Confucianism & trade flourished.
                   • Silk Road trade expanded, linking China to Rome & India
                   • Civil Service Exam introduced for government jobs
                   • Paper invented, Buddhism spread from India
                   • Fell due to corruption, peasant revolts, and invasions

                   III. Medieval & Golden Age Dynasties (618–1279 CE)

                   Tang Dynasty (618–907 CE)

                   📖 Cultural & territorial expansion.
                   • Expanded into Korea, Vietnam, and Central Asia
                   • Buddhism flourished, later suppressed
                   • Gunpowder & block printing invented
                   • Capital Chang'an was the largest city in the world

                   Song Dynasty (960–1279 CE)

                   📖 Economic & technological innovations.
                   • Paper money, porcelain, and compass improved trade
                   • Neo-Confucianism emerged
                   • Foot-binding became widespread among elite women

                   IV. Mongol Rule – The Yuan Dynasty (1271–1368 CE)

                   📖 China ruled by foreign Mongols.
                   • Kublai Khan conquered Song China and established the Yuan Dynasty
                   • Excluded Chinese from top government positions
                   • Marco Polo (1275 CE) visited & described China's wealth
                   • Overthrown by the Ming Dynasty due to Chinese resentment

                   V. Late Imperial China (1368–1912 CE)

                   Ming Dynasty (1368–1644 CE)

                   📖 Restoration of Chinese rule & maritime exploration.
                   • Rebuilt the Great Wall, restored Confucian bureaucracy
                   • Admiral Zheng He led naval expeditions to Africa & the Middle East
                   • Isolationism began, restricting foreign trade

                   Qing Dynasty (1644–1912 CE)

                   📖 Manchu rulers expanded China's borders (Taiwan, Tibet, Mongolia).
                   • Limited European trade, led to Opium Wars (1839–1842, 1856–1860)
                   • Taiping & Boxer Rebellions weakened Qing control
                   • 1911 Revolution overthrew the dynasty, leading to the Republic of China

                   VI. Chinese Legacy & Contributions
                   • Silk Road trade network connected East and West
                   • Confucianism influenced governments across East Asia
                   • Gunpowder, paper, printing, compass spread globally
                   • Great Wall, Forbidden City, and Terracotta Army remain historical landmarks

                   📚 Quick Quiz:
                   1. What was the Mandate of Heaven, and how did it justify rule?
                   2. How did the Han Dynasty contribute to China's cultural development?
                   3. What were the major inventions of the Tang and Song dynasties?
                   4. How did the Mongols rule China under the Yuan Dynasty?
                   5. What led to the fall of the Qing Dynasty?
                   """)
            
        case .aztecEmpire:
            return ("🛡️ The Aztec Empire",
                   """
                   I. Origins & Expansion (c. 1345–1521 CE)

                   📖 The Aztecs, also known as the Mexica, built a powerful empire in Mesoamerica.
                   • Migrated to Lake Texcoco in central Mexico
                   • Founded Tenochtitlán (1325 CE) on an island, using chinampas (floating gardens) for farming
                   • Triple Alliance (1428 CE): Aztecs allied with Texcoco & Tlacopan to dominate the region
                   • By the early 1500s, ruled 5–6 million people

                   II. Government & Society
                   • Emperor (Huey Tlatoani): Supreme ruler, considered semi-divine
                   • Tribute System: Conquered cities paid food, goods, and captives
                   • Social Structure: Nobles, warriors, priests, merchants, artisans, farmers, and slaves
                   • Human Sacrifice:
                       - Huitzilopochtli (Sun God) required blood offerings to keep the sun rising
                       - Prisoners of war were often sacrificed at Templo Mayor

                   III. Economy & Achievements
                   • Chinampas (Floating Gardens): Increased agricultural production
                   • Trade Networks: Used a barter system; cocoa beans were currency
                   • Engineering: Built causeways, aqueducts, and temples
                   • Calendar System: 365-day solar calendar for agriculture, 260-day ritual calendar

                   IV. The Spanish Conquest (1519–1521)
                   • Hernán Cortés (1519 CE): Spanish conquistador arrived with 600 men
                   • Allied with enemies of the Aztecs (e.g., the Tlaxcalans)
                   • Moctezuma II (r. 1502–1520) hesitated, thinking Cortés might be Quetzalcoatl (a god)
                   • Siege of Tenochtitlán (1521 CE): Smallpox weakened the Aztecs; city fell after months of fighting
                   • Spanish destroyed Tenochtitlán, building Mexico City in its place

                   V. Aztec Legacy
                   • Nahuatl language still spoken in Mexico
                   • Art & architecture: Codices, pyramids, feathered headdresses
                   • Day of the Dead (Día de los Muertos) has Aztec roots

                   📚 Quick Quiz:
                   1. What was the purpose of human sacrifice in Aztec religion?
                   2. How did the Aztecs build and sustain Tenochtitlán?
                   3. What role did the tribute system play in the Aztec economy?
                   4. How did Cortés and the Spanish conquer the Aztec Empire?
                   5. What aspects of Aztec culture survive today?
                   """)
        }
    }
    
    private func markAsRead() {
        switch empire {
        case .romanEmpire: romanEmpireRead = true
        case .byzantineEmpire: byzantineEmpireRead = true
        case .mongolEmpire: mongolEmpireRead = true
        case .ottomanEmpire: ottomanEmpireRead = true
        case .persianEmpire: persianEmpireRead = true
        case .egyptianEmpire: egyptianEmpireRead = true
        case .chineseEmpire: chineseEmpireRead = true
        case .aztecEmpire: aztecEmpireRead = true
        }
        
        NotificationCenter.default.post(
            name: NSNotification.Name("ShowAchievement"),
            object: nil,
            userInfo: ["message": "Achievement Unlocked: \(empire.rawValue) Reader! 📚"]
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(empireContent.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(empireContent.content)
                    .font(.body)
                    .lineSpacing(8)
                    .padding(.horizontal)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    markAsRead()
                    dismiss()
                }) {
                    Text("I've Read This")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
} 