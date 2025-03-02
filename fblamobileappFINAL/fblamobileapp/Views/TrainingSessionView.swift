import SwiftUI
import SwiftUI
import Combine

// A self-contained question model that won't conflict with existing models
struct TrainingQuestion: Identifiable {
    let id = UUID()
    let text: String
    let correctAnswer: String
    let options: [String]
    let explanation: String
    let empire: Empire
    
    static func sampleQuestions() -> [TrainingQuestion] {
        // Roman Empire - Easy Questions (5 questions)
        let romanEasyQuestions = [
            TrainingQuestion(
                text: "Who was the first emperor of Rome?",
                correctAnswer: "Augustus Caesar",
                options: ["Julius Caesar", "Augustus Caesar", "Nero", "Hadrian"],
                explanation: "After defeating Mark Antony and Cleopatra, Octavian was given the title Augustus Caesar by the Senate in 27 BCE, becoming the first Roman Emperor.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What type of government did Rome have before becoming an empire?",
                correctAnswer: "Republic",
                options: ["Monarchy", "Oligarchy", "Republic", "Theocracy"],
                explanation: "Before becoming an empire, Rome was governed as a Republic for nearly 500 years, with elected officials, a Senate, and assemblies representing citizens.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "Who were the common people of Rome?",
                correctAnswer: "Plebeians",
                options: ["Patricians", "Plebeians", "Senators", "Legionaries"],
                explanation: "Plebeians were the common citizens of Rome, as opposed to the patricians who were aristocrats. They made up the majority of Rome's population.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was the Pax Romana?",
                correctAnswer: "A 200-year period of peace and stability",
                options: ["A Roman legal system", "A 200-year period of peace and stability", "The expansion of Roman roads", "A war against Carthage"],
                explanation: "The Pax Romana ('Roman Peace') was a period of relative peace and stability throughout the Roman Empire, lasting from 27 BCE to 180 CE.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was the purpose of the Twelve Tables?",
                correctAnswer: "The first written Roman laws",
                options: ["A set of military strategies", "The first written Roman laws", "A religious doctrine", "A trade policy with Carthage"],
                explanation: "Created around 450 BCE, the Twelve Tables were Rome's first formal legal code, written to protect plebeians from arbitrary interpretation of unwritten laws by patrician judges.",
                empire: .romanEmpire
            )
        ]
        
        // Roman Empire - Medium Questions (5 questions)
        let romanMediumQuestions = [
            TrainingQuestion(
                text: "What major reform did Diocletian introduce to help stabilize Rome?",
                correctAnswer: "He split the empire into Eastern and Western halves",
                options: ["He legalized Christianity", "He split the empire into Eastern and Western halves", "He expanded Roman citizenship to all conquered people", "He created the first Roman navy"],
                explanation: "In 285 CE, Diocletian divided the Roman Empire into Eastern and Western administrative divisions to make governance more manageable and help stabilize the vast territory facing external threats.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "Which of the following was NOT a cause of the fall of the Western Roman Empire?",
                correctAnswer: "The complete destruction of Rome's capital city",
                options: ["Barbarian invasions", "Economic problems", "Military overspending", "The complete destruction of Rome's capital city"],
                explanation: "While Rome was sacked several times, the capital city was never completely destroyed. The fall of the Western Roman Empire was caused by a combination of economic decline, military pressure, political instability, and barbarian invasions.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What role did the Roman Senate have during the Republic?",
                correctAnswer: "They advised consuls and created laws",
                options: ["They controlled the army", "They advised consuls and created laws", "They elected emperors", "They collected taxes"],
                explanation: "During the Roman Republic, the Senate was a powerful governing body that advised elected officials (consuls), proposed legislation, managed state finances, and directed foreign policy.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "Why was Julius Caesar assassinated?",
                correctAnswer: "The Senate feared he was becoming too powerful",
                options: ["He tried to declare war on Rome", "He was suspected of being a Carthaginian spy", "The Senate feared he was becoming too powerful", "He refused to expand the empire"],
                explanation: "Julius Caesar was assassinated in 44 BCE by a group of senators who feared his increasing power, especially after he was named dictator perpetuo (dictator for life), which threatened the Republic's traditional power structure.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was a latifundia?",
                correctAnswer: "A large slave-run plantation",
                options: ["A type of Roman military formation", "A large slave-run plantation", "A temple dedicated to the gods", "A public bathhouse"],
                explanation: "Latifundia were large agricultural estates (plantations) in the Roman Republic and Empire that relied heavily on slave labor. They produced olive oil, wine, and grain, and significantly changed Rome's agricultural economy.",
                empire: .romanEmpire
            )
        ]
        
        // Roman Empire - Hard Questions (5 questions)
        let romanHardQuestions = [
            TrainingQuestion(
                text: "What major economic issue contributed to Rome's decline?",
                correctAnswer: "Inflation",
                options: ["Inflation", "Lack of trade with China", "A surplus of gold", "A tax break for patricians"],
                explanation: "As mentioned in the reading section 'IV. Decline & Fall of Rome,' economic problems including inflation were key factors in Rome's decline, along with political instability and military weakness.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was the primary function of Roman aqueducts?",
                correctAnswer: "To carry fresh water to cities",
                options: ["To carry fresh water to cities", "To defend against invasions", "To transport the army", "To be used for religious ceremonies"],
                explanation: "As noted in the reading section 'III. The Roman Empire & Pax Romana,' aqueducts were among Rome's major achievements, bringing fresh water to cities across the empire.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "How did Roman law influence modern legal systems?",
                correctAnswer: "It became the basis for modern legal codes",
                options: ["It became the basis for modern legal codes", "By establishing religious courts", "By eliminating the need for trials", "By allowing emperors to rule indefinitely"],
                explanation: "As stated in the reading section 'V. Rome's Lasting Legacy,' Roman law and government became the basis for modern democracy and legal codes.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What happened to the Roman Empire in 476 CE?",
                correctAnswer: "Western Rome fell to Germanic tribes",
                options: ["Western Rome fell to Germanic tribes", "The Senate declared a new Republic", "The empire expanded into Africa", "The Eastern Empire collapsed"],
                explanation: "As mentioned in the reading section 'IV. Decline & Fall of Rome,' in 476 CE, Western Rome fell to Germanic tribes, while the Eastern Rome (Byzantine Empire) survived.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What role did Christianity play in the Roman Empire?",
                correctAnswer: "It was initially persecuted but later legalized by Constantine",
                options: ["It was the original religion of Rome", "It was initially persecuted but later legalized by Constantine", "It was banned throughout the empire's history", "It was only practiced in the Eastern provinces"],
                explanation: "As noted in the reading section 'III. The Roman Empire & Pax Romana,' Christianity spread during the 1st century CE and was persecuted until Constantine legalized it in 313 CE.",
                empire: .romanEmpire
            )
        ]
        
        // Roman Empire - Expert Questions (5 questions)
        let romanExpertQuestions = [
            TrainingQuestion(
                text: "What was the purpose of the Tetrarchy, established by Diocletian?",
                correctAnswer: "To create four co-rulers to govern the vast empire",
                options: ["To divide military power among Roman generals", "To create four co-rulers to govern the vast empire", "To allow the Senate to regain control", "To unify Rome under a single emperor"],
                explanation: "Diocletian established the Tetrarchy (rule of four) in 293 CE, dividing imperial authority among two senior emperors (Augusti) and two junior emperors (Caesars) to address the challenges of governing the vast empire and securing succession.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "How did Roman citizenship policies change as the empire expanded?",
                correctAnswer: "Citizenship was extended to most free inhabitants of the empire",
                options: ["Only patricians could become citizens", "Citizenship was extended to most free inhabitants of the empire", "Citizenship was only given to soldiers", "Citizenship became irrelevant after the fall of the Republic"],
                explanation: "Roman citizenship gradually expanded over time, culminating in the Edict of Caracalla (Constitutio Antoniniana) in 212 CE, which granted citizenship to nearly all free men throughout the Roman Empire, dramatically increasing the number of citizens.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was the function of the Cursus Honorum?",
                correctAnswer: "The political career path for Roman officials",
                options: ["A road-building project", "The structure of military ranks", "The political career path for Roman officials", "A tax system for the provinces"],
                explanation: "The Cursus Honorum ('course of honors') was the sequential order of public offices held by politicians in the Roman Republic. It established the required steps and ages for advancement in Roman politics, from quaestor to consul.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "What was one long-term impact of the Third Century Crisis (235–284 CE)?",
                correctAnswer: "The empire was permanently divided into East and West",
                options: ["The empire was permanently divided into East and West", "The Senate regained power over the emperor", "Rome fully adopted Christianity", "Carthage was rebuilt as a Roman city"],
                explanation: "The Third Century Crisis led to fundamental restructuring of the Roman Empire, including Diocletian's division of the empire, which established the precedent for permanent Eastern and Western administrations that would later become separate empires.",
                empire: .romanEmpire
            ),
            TrainingQuestion(
                text: "Why did Constantine move the capital to Byzantium (later Constantinople)?",
                correctAnswer: "It had a stronger economy and better defenses",
                options: ["It was closer to Persian trade routes", "It had a stronger economy and better defenses", "Rome had been destroyed by invaders", "The Senate forced him to move"],
                explanation: "Constantine chose Byzantium because of its strategic location between Europe and Asia, excellent natural defenses with water on three sides, proximity to the wealthy eastern provinces, and distance from the vulnerable western frontiers facing barbarian threats.",
                empire: .romanEmpire
            )
        ]
        
        // Byzantine Empire - Easy Questions (5 questions)
        let byzantineEasyQuestions = [
            TrainingQuestion(
                text: "What city became the capital of the Byzantine Empire in 330 CE?",
                correctAnswer: "Constantinople",
                options: ["Rome", "Athens", "Constantinople", "Antioch"],
                explanation: "In 330 CE, Emperor Constantine I moved the capital of the Roman Empire from Rome to Byzantium, which he renamed Constantinople (modern Istanbul). This city became the capital of what would later be known as the Byzantine Empire.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "Who was the first emperor of the Byzantine Empire?",
                correctAnswer: "Constantine I",
                options: ["Augustus", "Constantine I", "Justinian I", "Theodosius"],
                explanation: "Constantine I founded Constantinople in 330 CE and is considered the first Byzantine Emperor, though at the time it was still called the Eastern Roman Empire. He moved the capital from Rome to Byzantium, renaming it Constantinople.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the primary language of the Byzantine Empire?",
                correctAnswer: "Greek",
                options: ["Latin", "Greek", "Persian", "Arabic"],
                explanation: "While the Western Roman Empire used Latin, the Byzantine Empire (Eastern Roman Empire) primarily used Greek, reflecting the cultural differences between the regions and the strong Hellenic influence in the eastern Mediterranean.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the main religion of the Byzantine Empire?",
                correctAnswer: "Christianity",
                options: ["Christianity", "Judaism", "Islam", "Zoroastrianism"],
                explanation: "Christianity was the main religion of the Byzantine Empire. After Constantine's conversion and the Edict of Milan, Christianity grew to become the dominant faith, eventually developing into Eastern Orthodox Christianity.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What legal system did Justinian I create?",
                correctAnswer: "The Corpus Juris Civilis (Justinian Code)",
                options: ["The Magna Carta", "The Code of Hammurabi", "The Corpus Juris Civilis (Justinian Code)", "The Twelve Tables"],
                explanation: "Justinian I created the Corpus Juris Civilis (Justinian's Code), a comprehensive collection and reorganization of Roman law that became the foundation for many modern legal systems and preserved Roman legal knowledge.",
                empire: .byzantineEmpire
            )
        ]
        
        // Byzantine Empire - Medium Questions (5 questions)
        let byzantineMediumQuestions = [
            TrainingQuestion(
                text: "Who was Emperor Justinian I's powerful and influential wife?",
                correctAnswer: "Theodora",
                options: ["Helena", "Irene", "Theodora", "Zoe"],
                explanation: "Theodora was Justinian I's influential wife who played a crucial role in Byzantine politics. A former actress, she became one of the most powerful women in Byzantine history and helped suppress the Nika riots that threatened Justinian's rule.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What term describes the distinctive Byzantine art style featuring religious figures?",
                correctAnswer: "Iconography",
                options: ["Renaissance", "Impressionism", "Iconography", "Cubism"],
                explanation: "Byzantine iconography was a distinctive religious art style featuring stylized depictions of religious figures against gold backgrounds. These sacred images played an important role in Orthodox Christian worship and became a hallmark of Byzantine artistic expression.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the Hippodrome used for in Byzantine society?",
                correctAnswer: "Chariot races and public gatherings",
                options: ["Religious ceremonies", "Military training", "Imperial coronations", "Chariot races and public gatherings"],
                explanation: "The Hippodrome was a massive stadium in Constantinople where chariot races and other public events were held. Beyond entertainment, it served as a social and political forum where citizens could gather and even voice grievances to the emperor.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the iconoclasm controversy in Byzantine history?",
                correctAnswer: "A dispute over the use of religious images",
                options: ["A war against the Sassanid Empire", "A dispute over succession to the throne", "A dispute over the use of religious images", "A conflict with the Pope in Rome"],
                explanation: "The iconoclasm controversy (8th-9th centuries) was a bitter dispute over whether religious images (icons) should be used in worship. Iconoclasts destroyed religious artwork believing it constituted idolatry, while iconodules defended their use in worship.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "Who were the Varangian Guard?",
                correctAnswer: "Elite Viking mercenaries who served as the emperor's bodyguards",
                options: ["Byzantine naval commanders", "Elite Viking mercenaries who served as the emperor's bodyguards", "Local militia from Anatolia", "Persian allies who protected the eastern borders"],
                explanation: "The Varangian Guard was an elite unit of mostly Norse/Viking warriors who served as the personal bodyguards of Byzantine emperors from the 10th to 14th centuries. They were known for their fierce loyalty, battle prowess, and their distinctive axes.",
                empire: .byzantineEmpire
            )
        ]
        
        // Byzantine Empire - Hard Questions (5 questions)
        let byzantineHardQuestions = [
            TrainingQuestion(
                text: "What was the Theme System?",
                correctAnswer: "A system of dividing the empire into military provinces",
                options: ["A Byzantine religious reform", "A system of dividing the empire into military provinces", "A trade route between Byzantium and China", "The method of electing Byzantine emperors"],
                explanation: "The Theme System was a military-administrative structure implemented in the 7th century that divided the empire into provinces (themes), each led by a military governor. This reorganization helped Byzantium survive the Arab invasions and strengthened provincial defense.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the primary purpose of Greek Fire?",
                correctAnswer: "To be used as a weapon in naval battles",
                options: ["To purify water supplies", "To be used as a weapon in naval battles", "To heat homes during the winter", "To fuel lamps in churches"],
                explanation: "Greek Fire was a secret incendiary weapon used by the Byzantine navy that could burn on water. This devastating weapon gave the Byzantines naval superiority, helping them defeat Arab sieges of Constantinople in the 7th-8th centuries.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What event in 1054 CE had a lasting impact on Christianity?",
                correctAnswer: "The Great Schism between the Eastern and Western Churches",
                options: ["The Fall of Jerusalem", "The Great Schism between the Eastern and Western Churches", "The Council of Nicaea", "The Christianization of Russia"],
                explanation: "The Great Schism of 1054 CE formalized the split between the Eastern Orthodox Church (centered in Constantinople) and the Roman Catholic Church (centered in Rome), a division that continues to this day.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the significance of the Fourth Crusade (1204) for the Byzantine Empire?",
                correctAnswer: "Western crusaders captured and sacked Constantinople",
                options: ["It strengthened Byzantine control over the Holy Land", "Western crusaders captured and sacked Constantinople", "It created a permanent alliance with Venice", "It led to the recapture of Jerusalem"],
                explanation: "The Fourth Crusade resulted in the shocking capture and sack of Constantinople by Western crusaders in 1204. This catastrophic event severely weakened the Byzantine Empire, leading to its fragmentation and accelerating its eventual decline.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What role did Empress Irene play in Byzantine history?",
                correctAnswer: "She restored icon veneration and was the first woman to rule in her own right",
                options: ["She conquered the Sassanid Persian Empire", "She restored icon veneration and was the first woman to rule in her own right", "She converted the empire to Catholicism", "She established the Theme System"],
                explanation: "Empress Irene (ruled 797-802) was the first woman to rule the Byzantine Empire in her own right. She ended the first phase of Iconoclasm by restoring the veneration of icons and attempted to improve relations with Western Europe.",
                empire: .byzantineEmpire
            )
        ]
        
        // Byzantine Empire - Expert Questions (5 questions)
        let byzantineExpertQuestions = [
            TrainingQuestion(
                text: "How did the Byzantine Empire maintain its economy in the early Middle Ages?",
                correctAnswer: "By controlling key trade routes between Europe and Asia",
                options: ["By creating the feudal system", "By controlling key trade routes between Europe and Asia", "By expanding into Africa for resources", "By relying exclusively on agriculture"],
                explanation: "The Byzantine Empire maintained a strong economy by controlling vital trade routes between Europe and Asia. Constantinople's strategic position allowed the Byzantines to tax trade passing between the Mediterranean and Black Sea, generating significant revenue for the empire.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the Strategikon, and why was it important?",
                correctAnswer: "A military manual written by Emperor Maurice, detailing Byzantine warfare strategies",
                options: ["A military manual written by Emperor Maurice, detailing Byzantine warfare strategies", "A collection of laws governing Byzantine trade", "A tax system used in Byzantine provinces", "A religious document explaining Orthodox theology"],
                explanation: "The Strategikon was a comprehensive military manual attributed to Emperor Maurice (582-602 CE). It detailed Byzantine military tactics, strategy, and organization, including how to fight various enemies. This sophisticated approach to warfare helped Byzantium survive against numerous threats.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the Byzantine diplomatic practice known as 'dividing and ruling'?",
                correctAnswer: "Using diplomacy to pit potential enemies against each other",
                options: ["Splitting the empire into smaller administrative units", "Using diplomacy to pit potential enemies against each other", "Rotating military leaders to prevent coups", "Separating religious and political authority"],
                explanation: "The Byzantines expertly practiced 'divide and rule' diplomacy, using bribes, marriages, and treaties to turn potential enemies against each other. This sophisticated diplomatic strategy allowed the empire to survive despite being surrounded by powerful adversaries.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What was the Komnenian Restoration?",
                correctAnswer: "A period of imperial recovery led by the Komnenos dynasty",
                options: ["The rebuilding of Constantinople after the Arab siege", "A religious revival after iconoclasm", "A period of imperial recovery led by the Komnenos dynasty", "The restoration of Roman law under Justinian"],
                explanation: "The Komnenian Restoration (1081-1185) was a period of Byzantine imperial recovery under emperors of the Komnenos dynasty, particularly Alexios I, John II, and Manuel I. They stabilized the empire's finances, strengthened the military, and temporarily reversed territorial losses.",
                empire: .byzantineEmpire
            ),
            TrainingQuestion(
                text: "What innovation in Byzantine warfare was the 'pronoia' system?",
                correctAnswer: "A method of granting land to soldiers in exchange for military service",
                options: ["A new type of naval vessel", "A method of granting land to soldiers in exchange for military service", "A siege weapon technology", "A formation of heavy cavalry"],
                explanation: "The pronoia system was a method of military organization developed in the late Byzantine period where soldiers received land grants (pronoiai) in exchange for military service. Similar to Western feudalism but with key differences, it helped the cash-strapped empire maintain a military force.",
                empire: .byzantineEmpire
            )
        ]
        
        // Mongol Empire - Easy Questions (5 questions)
        let mongolEasyQuestions = [
            TrainingQuestion(
                text: "Who was the founder of the Mongol Empire?",
                correctAnswer: "Genghis Khan",
                options: ["Batu Khan", "Kublai Khan", "Genghis Khan", "Tamerlane"],
                explanation: "Genghis Khan (born Temujin) united the Mongol tribes in 1206 CE and founded the Mongol Empire. He laid the foundation for what would become the largest contiguous land empire in history through his military conquests across Asia.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was Genghis Khan's birth name?",
                correctAnswer: "Temujin",
                options: ["Ögedei", "Timur", "Temujin", "Subotai"],
                explanation: "Genghis Khan was born as Temujin around 1162 CE. He received the title 'Genghis Khan,' meaning 'Universal Ruler,' after unifying the Mongol tribes and being proclaimed leader of all Mongols in 1206 CE.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What type of military tactics did the Mongols use to conquer vast territories?",
                correctAnswer: "Horse archery and hit-and-run attacks",
                options: ["Naval warfare", "Heavy infantry charges", "Horse archery and hit-and-run attacks", "Defensive fortifications"],
                explanation: "The Mongols were expert horse archers who utilized mobility, feigned retreats, and hit-and-run tactics. They could shoot arrows accurately while riding at full gallop, giving them a significant advantage over the infantry-based armies they faced.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the Pax Mongolica?",
                correctAnswer: "A period of stability and increased trade across Eurasia",
                options: ["A peace treaty between the Mongols and China", "A period of stability and increased trade across Eurasia", "The Mongol policy of religious persecution", "The Mongol conquest of Persia"],
                explanation: "The Pax Mongolica ('Mongol Peace') was a period in the 13th-14th centuries when the Mongol Empire controlled vast territories, creating stability that allowed safe travel and trade across Eurasia. This facilitated cultural exchange and commerce along the Silk Road.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the main reason for Mongol military success?",
                correctAnswer: "Their disciplined cavalry and superior tactics",
                options: ["Their large navy", "Their use of war elephants", "Their disciplined cavalry and superior tactics", "Their alliance with the Holy Roman Empire"],
                explanation: "The Mongols' military success stemmed from their disciplined cavalry, tactical flexibility, and superior skill in mounted warfare. Their armies were highly mobile, well-coordinated, and used psychological warfare to intimidate enemies into surrender.",
                empire: .mongolEmpire
            )
        ]
        
        // Mongol Empire - Medium Questions (5 questions)
        let mongolMediumQuestions = [
            TrainingQuestion(
                text: "What was the largest land empire in history?",
                correctAnswer: "The Mongol Empire",
                options: ["The British Empire", "The Mongol Empire", "The Roman Empire", "The Persian Empire"],
                explanation: "At its height in the 13th century, the Mongol Empire was the largest contiguous land empire in history, covering approximately 24 million square kilometers (9.3 million square miles) from Eastern Europe to the Sea of Japan, and from Siberia to Southeast Asia and the Middle East.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the Mongols' strategy for ruling conquered territories?",
                correctAnswer: "They allowed local rulers to govern but demanded tribute",
                options: ["They removed local leaders and directly controlled all areas", "They allowed local rulers to govern but demanded tribute", "They forced all conquered peoples to adopt Mongol customs", "They abandoned all lands after conquering them"],
                explanation: "The Mongols often maintained local administrative structures and allowed local rulers to govern, provided they demonstrated loyalty and paid regular tribute. This indirect rule was pragmatic, allowing the Mongols to control vast territories with relatively few administrators.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the yam system?",
                correctAnswer: "A sophisticated postal relay system",
                options: ["A military formation", "A sophisticated postal relay system", "A religious practice", "A type of Mongol dwelling"],
                explanation: "The yam system was an extensive network of relay stations throughout the Mongol Empire that enabled rapid communication and travel. Messengers could travel up to 250 miles per day, allowing for efficient governance of the vast empire.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What religion did most Mongols follow before their conquests?",
                correctAnswer: "Tengrism (shamanism)",
                options: ["Buddhism", "Islam", "Christianity", "Tengrism (shamanism)"],
                explanation: "Before their conquests, most Mongols practiced Tengrism, a shamanistic belief system that venerated the eternal blue sky (Tengri) and incorporated ancestor worship. The Mongols later became known for their religious tolerance, adopting various faiths across different regions.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "Who was Kublai Khan?",
                correctAnswer: "Genghis Khan's grandson who conquered China and founded the Yuan Dynasty",
                options: ["Genghis Khan's main general", "A Russian prince who defeated the Mongols", "Genghis Khan's grandson who conquered China and founded the Yuan Dynasty", "The last ruler of the unified Mongol Empire"],
                explanation: "Kublai Khan was Genghis Khan's grandson who completed the conquest of China, established the Yuan Dynasty (1271-1368), and moved the Mongol capital to Beijing. His rule marked both the height of Mongol power in East Asia and the beginning of the empire's fragmentation.",
                empire: .mongolEmpire
            )
        ]
        
        // Mongol Empire - Hard Questions (5 questions)
        let mongolHardQuestions = [
            TrainingQuestion(
                text: "What happened to the Mongol Empire after Genghis Khan's death?",
                correctAnswer: "It was divided among his sons and grandsons into four khanates",
                options: ["It immediately collapsed", "It was divided among his sons and grandsons into four khanates", "It was conquered by China", "It expanded further under his direct successor"],
                explanation: "After Genghis Khan's death in 1227, the empire was divided among his sons and grandsons, eventually forming four major khanates: the Golden Horde (Russia/Eastern Europe), the Chagatai Khanate (Central Asia), the Ilkhanate (Persia/Middle East), and the Yuan Dynasty (China).",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "Why did the Mongols ultimately fail to conquer Japan?",
                correctAnswer: "Their invasion fleets were destroyed by typhoons (kamikaze)",
                options: ["Japanese samurai defeated them in open battle", "Their invasion fleets were destroyed by typhoons (kamikaze)", "They lacked sufficient naval technology", "They decided Japan had no valuable resources"],
                explanation: "The Mongols attempted to invade Japan in 1274 and 1281, but both times their fleets were largely destroyed by typhoons that the Japanese called 'kamikaze' (divine wind). These natural disasters, combined with Japanese resistance, prevented the conquest of Japan.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "How did Genghis Khan revolutionize warfare?",
                correctAnswer: "He created a disciplined army based on decimal organization",
                options: ["He was the first to use gunpowder", "He created a disciplined army based on decimal organization", "He built the largest navy in history", "He invented new siege weapons"],
                explanation: "Genghis Khan revolutionized warfare by reorganizing the traditional tribal units into a decimal system (units of 10, 100, 1,000, and 10,000 warriors), creating a disciplined, meritocratic army where loyalty was to the khan rather than tribal leaders.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was significant about the Mongol conquest of Baghdad in 1258?",
                correctAnswer: "It ended the Abbasid Caliphate and destroyed the center of Islamic learning",
                options: ["It ended the Abbasid Caliphate and destroyed the center of Islamic learning", "It was the first time the Mongols used cannons", "It was their only failed siege", "It led to the Mongols converting to Islam"],
                explanation: "The Mongol conquest of Baghdad in 1258 under Hulagu Khan ended the Abbasid Caliphate, which had ruled the Islamic world for 500 years. The destruction of libraries and killing of scholars devastated one of the world's great centers of learning and culture.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What historical role did the Golden Horde play in Russian history?",
                correctAnswer: "They ruled over Russian principalities for about 250 years",
                options: ["They helped Russia defeat the Byzantine Empire", "They ruled over Russian principalities for about 250 years", "They never actually conquered Russian territory", "They were quickly defeated by Alexander Nevsky"],
                explanation: "The Golden Horde, the northwestern khanate of the Mongol Empire, conquered the Russian principalities in the 1230s and ruled over them for approximately 250 years. Russian princes had to pay tribute and receive approval from the khan, significantly influencing Russian political development.",
                empire: .mongolEmpire
            )
        ]
        
        // Mongol Empire - Expert Questions (5 questions)
        let mongolExpertQuestions = [
            TrainingQuestion(
                text: "What was the Kurultai, and how did it function in Mongol politics?",
                correctAnswer: "A council where Mongol leaders gathered to choose the Great Khan",
                options: ["A battlefield strategy used by Mongol generals", "A council where Mongol leaders gathered to choose the Great Khan", "A tax-collection system", "A religious ceremony performed before battle"],
                explanation: "The Kurultai was a political and military council where Mongol clan leaders and nobles gathered to make important decisions, particularly the selection of a new Great Khan. This assembly reflected the Mongols' traditional consultative governance, requiring consensus among tribal leaders for major decisions.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "Why was the Mongol conquest of China different from their other conquests?",
                correctAnswer: "It took decades of warfare and required adapting to siege tactics",
                options: ["It took decades of warfare and required adapting to siege tactics", "The Chinese surrendered without resistance", "The Mongols burned every Chinese city to the ground", "The Mongols refused to rule China and abandoned it"],
                explanation: "The Mongol conquest of China was exceptionally challenging, taking over 60 years from the first campaigns against the Jin Dynasty to the final defeat of the Southern Song in 1279. The Mongols had to adapt their traditional steppe warfare tactics to siege warfare, develop naval capabilities, and overcome sophisticated Chinese fortifications.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "How did the Mongols use psychological warfare in their campaigns?",
                correctAnswer: "They used spies to spread rumors about their brutality",
                options: ["They used spies to spread rumors about their brutality", "They relied solely on large armies to overwhelm enemies", "They created massive fortresses to intimidate opponents", "They formed alliances with all of their enemies before attacking"],
                explanation: "The Mongols expertly employed psychological warfare by deliberately spreading stories of their ruthlessness to encourage surrender without resistance. They often allowed refugees from conquered cities to flee, spreading terror among neighboring populations and sometimes offered generous terms to cities that surrendered immediately while brutally destroying those that resisted.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the Divine Wind (Kamikaze), and how did it impact Mongol history?",
                correctAnswer: "A typhoon that destroyed Mongol invasion fleets attempting to conquer Japan",
                options: ["A volcanic eruption that destroyed Mongol supply ships", "A typhoon that destroyed Mongol invasion fleets attempting to conquer Japan", "A natural disaster that affected Mongol agriculture", "A political event that led to Mongol retreat"],
                explanation: "The Divine Wind (Kamikaze) was a typhoon that struck the Mongol invasion fleets attempting to conquer Japan in 1274 and 1281. This natural disaster significantly impacted Mongol military strategy and contributed to their eventual withdrawal from Japan.",
                empire: .mongolEmpire
            ),
            TrainingQuestion(
                text: "What was the long-term impact of the Mongol conquests on Eurasian trade?",
                correctAnswer: "They created a unified trade network that facilitated exchange between East and West",
                options: ["They completely ended trade between China and Europe", "They created a unified trade network that facilitated exchange between East and West", "They made trade impossible due to constant warfare", "Their conquests had minimal impact on Eurasian trade"],
                explanation: "The Mongol conquests created an unprecedented unified trade zone spanning Eurasia, connecting China, India, the Middle East, and Europe. The resulting Pax Mongolica facilitated the flow of goods, ideas, technologies, and even diseases across vast distances, profoundly influencing world history and setting the stage for the later Age of Exploration.",
                empire: .mongolEmpire
            )
        ]
        
        // Ottoman Empire - Easy Questions (5 questions)
        let ottomanEasyQuestions = [
            TrainingQuestion(
                text: "Who founded the Ottoman Empire in 1299 CE?",
                correctAnswer: "Osman I",
                options: ["Suleiman the Magnificent", "Mehmed II", "Osman I", "Mustafa Kemal Atatürk"],
                explanation: "The Ottoman Empire was founded by Osman I in 1299 CE in Anatolia (modern Turkey), as mentioned in the reading section 'I. Origins & Early Expansion.'",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Which city became the Ottoman capital after its conquest in 1453?",
                correctAnswer: "Constantinople (renamed Istanbul)",
                options: ["Baghdad", "Cairo", "Constantinople (renamed Istanbul)", "Vienna"],
                explanation: "After conquering Constantinople in 1453, Sultan Mehmed II renamed it Istanbul and made it the Ottoman capital, as noted in the reading section about the Fall of Constantinople.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Which Ottoman sultan is known as 'The Conqueror' for capturing Constantinople?",
                correctAnswer: "Mehmed II",
                options: ["Osman I", "Suleiman", "Mehmed II", "Selim I"],
                explanation: "Sultan Mehmed II, known as 'The Conqueror,' led the successful siege of Constantinople in 1453, using massive cannons to breach the city's walls, as described in the reading section about the Fall of Constantinople.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Which Ottoman ruler is known as 'The Magnificent' and led the empire during its Golden Age?",
                correctAnswer: "Suleiman",
                options: ["Mehmed II", "Suleiman", "Osman I", "Selim II"],
                explanation: "Suleiman the Magnificent ruled from 1520 to 1566 during the Ottoman Empire's Golden Age. Under his rule, the empire expanded into Hungary, North Africa, and the Middle East, as mentioned in section 'II. The Golden Age.'",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What was the Millet System in the Ottoman Empire?",
                correctAnswer: "A system that allowed religious minorities self-governance",
                options: ["A military training program", "A tax collection method", "A system that allowed religious minorities self-governance", "A postal service"],
                explanation: "The Millet System was a governance approach that allowed religious minorities (Christians, Jews) to maintain self-governance within the Ottoman Empire, as explained in section 'III. Government & Society.'",
                empire: .ottomanEmpire
            )
        ]
        
        // Ottoman Empire - Medium Questions (5 questions)
        let ottomanMediumQuestions = [
            TrainingQuestion(
                text: "What elite military force was created from Christian children in the Ottoman Empire?",
                correctAnswer: "Janissaries",
                options: ["Mamluks", "Ghazi warriors", "Janissaries", "Sipahis"],
                explanation: "The Janissaries were elite slave soldiers who were taken from Christian families through the Devshirme System, as mentioned in section 'II. The Golden Age.' They became one of the most powerful military forces in the Ottoman Empire.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What was the term for Islamic fighters who expanded Ottoman territory in the early period?",
                correctAnswer: "Ghazi warriors",
                options: ["Janissaries", "Ghazi warriors", "Mamluks", "Pashas"],
                explanation: "As mentioned in section 'I. Origins & Early Expansion,' ghazi warriors (Islamic fighters) helped expand Ottoman territory, particularly into Byzantine lands, in the early period of the empire.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Which famous building was converted from a church to a mosque after the Ottoman conquest of Constantinople?",
                correctAnswer: "Hagia Sophia",
                options: ["Blue Mosque", "Süleymaniye Mosque", "Hagia Sophia", "Topkapi Palace"],
                explanation: "After conquering Constantinople in 1453, Mehmed II converted the Hagia Sophia from a Byzantine church into a mosque, as noted in the reading section about the Fall of Constantinople.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What major Ottoman military defeat marked the limit of their expansion into Europe?",
                correctAnswer: "Siege of Vienna (1683)",
                options: ["Battle of Lepanto", "Siege of Vienna (1683)", "Fall of Constantinople", "Battle of Mohács"],
                explanation: "The failed Siege of Vienna in 1683 CE marked the limit of Ottoman expansion into Europe and the beginning of their territorial retreat, as mentioned in section 'IV. Decline of the Empire.'",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Which ruler built the Süleymaniye Mosque and reformed the Ottoman legal system?",
                correctAnswer: "Suleiman the Magnificent",
                options: ["Mehmed II", "Osman I", "Suleiman the Magnificent", "Selim I"],
                explanation: "During the Golden Age under Suleiman the Magnificent (1520-1566), he implemented legal reforms and built many architectural wonders including the Süleymaniye Mosque, as detailed in section 'II. The Golden Age.'",
                empire: .ottomanEmpire
            )
        ]
        
        // Ottoman Empire - Hard Questions (5 questions)
        let ottomanHardQuestions = [
            TrainingQuestion(
                text: "What system did the Ottomans use to recruit Christian boys for service in the administration and military?",
                correctAnswer: "Devshirme System",
                options: ["Millet System", "Devshirme System", "Timar System", "Kanun System"],
                explanation: "The Devshirme System was used to recruit Christian boys who were converted to Islam and trained for service in the administration or the Janissary corps, as mentioned in the Golden Age section of the reading.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "Why was the Ottoman Empire referred to as the 'Sick Man of Europe' in the 1800s?",
                correctAnswer: "Due to its political decline and territorial losses",
                options: ["Because of widespread disease outbreaks", "Due to its political decline and territorial losses", "Because of its unique medical practices", "Due to religious conflicts"],
                explanation: "By the 1800s, the Ottoman Empire was called the 'Sick Man of Europe' due to corruption, weak leadership, military decline, and growing European power, as mentioned in section 'IV. Decline of the Empire.'",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What technologies did Mehmed II use to conquer Constantinople in 1453?",
                correctAnswer: "Massive cannons to breach the city walls",
                options: ["Improved naval vessels", "Massive cannons to breach the city walls", "Gunpowder mines under the walls", "Flying machines to attack from above"],
                explanation: "Mehmed II used massive cannons to breach Constantinople's walls, which were previously thought impenetrable, as detailed in the reading section about the Fall of Constantinople in 1453.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What happened to the Ottoman Empire after World War I?",
                correctAnswer: "It was abolished and replaced by modern Turkey",
                options: ["It expanded into new territories", "It joined the League of Nations", "It was abolished and replaced by modern Turkey", "It formed an alliance with Britain"],
                explanation: "After being defeated in World War I (1918), the Ottoman Empire lost its Arab lands to Britain and France and was finally abolished in 1922, replaced by modern Turkey under Mustafa Kemal Atatürk, as mentioned in section 'V. Fall of the Ottoman Empire.'",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What were two major cultural contributions of the Ottoman Empire?",
                correctAnswer: "Turkish coffee and Islamic calligraphy",
                options: ["Opera and ballet", "Turkish coffee and Islamic calligraphy", "Gothic architecture and oil painting", "Chess and playing cards"],
                explanation: "Among the Ottoman Empire's cultural contributions were Turkish coffee, Islamic calligraphy, textiles, and literature, as mentioned in section 'VI. Legacy of the Ottomans.'",
                empire: .ottomanEmpire
            )
        ]
        
        // Ottoman Empire - Expert Questions (5 questions)
        let ottomanExpertQuestions = [
            TrainingQuestion(
                text: "How did the Ottoman Empire's strategic position between Europe and Asia impact its development?",
                correctAnswer: "It allowed control of key trade routes between East and West",
                options: ["It forced them to constantly defend against attacks from both continents", "It allowed control of key trade routes between East and West", "It prevented cultural exchange with neighboring civilizations", "It limited their access to maritime trade"],
                explanation: "As mentioned in section 'III. Government & Society,' the Ottoman Empire's position enabled it to control key Silk Road and Mediterranean trade routes between Europe and Asia, which became a major source of economic power and cultural exchange.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What factors contributed to the Ottoman Empire's decline from the 17th to 19th centuries?",
                correctAnswer: "Military stagnation, corruption, and rising European powers",
                options: ["Rapid population growth and food shortages", "Religious conflicts between Muslims and Christians", "Military stagnation, corruption, and rising European powers", "Natural disasters and climate change"],
                explanation: "Section 'IV. Decline of the Empire' details how the Ottoman decline was caused by multiple factors: failed military expansion at Vienna, corruption and weak sultans, Janissaries resisting military modernization, and the rise of European rivals like Britain and Russia.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "How did the Ottoman governance model differ from contemporary European monarchies?",
                correctAnswer: "It used the Millet System to allow religious self-governance",
                options: ["It was a republic with elected officials", "It used the Millet System to allow religious self-governance", "It had no centralized authority", "It separated church and state completely"],
                explanation: "As described in section 'III. Government & Society,' the Ottomans used the Millet System to allow religious minorities (Christians and Jews) self-governance within the empire, which differed from the more religiously homogeneous European monarchies of the time.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "What was the historical significance of the 1453 conquest of Constantinople for both the Ottoman Empire and Europe?",
                correctAnswer: "It marked the end of the Byzantine Empire and shifted power in the Eastern Mediterranean",
                options: ["It had little impact on either the Ottomans or Europeans", "It marked the end of the Byzantine Empire and shifted power in the Eastern Mediterranean", "It led to immediate Ottoman control of all European territories", "It caused the Catholic-Orthodox religious split"],
                explanation: "As detailed in section 'I. Origins & Early Expansion,' the Fall of Constantinople in 1453 was a pivotal moment that ended the thousand-year Byzantine Empire, gave the Ottomans a strategic capital, and transformed the geopolitical landscape of the Eastern Mediterranean and Europe.",
                empire: .ottomanEmpire
            ),
            TrainingQuestion(
                text: "How did the Ottoman Empire's transition to modern Turkey represent a shift in governance and identity?",
                correctAnswer: "The empire was abolished and replaced by a secular republic under Atatürk",
                options: ["The transition was purely nominal with no significant changes", "The monarchy continued but with limited powers", "The empire was abolished and replaced by a secular republic under Atatürk", "The empire was divided among European colonial powers"],
                explanation: "Section 'V. Fall of the Ottoman Empire' explains that after defeat in World War I, the Ottoman Empire was abolished in 1922 and replaced by modern Turkey under Mustafa Kemal Atatürk, representing a fundamental shift from a multi-ethnic, religiously-oriented empire to a Turkish national state.",
                empire: .ottomanEmpire
            )
        ]
        
        // Persian Empire - Easy Questions (5 questions)
        let persianEasyQuestions = [
            TrainingQuestion(
                text: "Who founded the first Persian Empire?",
                correctAnswer: "Cyrus the Great",
                options: ["Darius I", "Cyrus the Great", "Xerxes I", "Alexander the Great"],
                explanation: "As mentioned in section 'I. The Achaemenid Empire,' Cyrus the Great founded the first Persian Empire (Achaemenid Empire) around 550 BCE by conquering Babylon, Lydia, and Media.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What was the name of the first Persian Empire?",
                correctAnswer: "Achaemenid Empire",
                options: ["Sassanian Empire", "Achaemenid Empire", "Parthian Empire", "Median Empire"],
                explanation: "The first Persian Empire was called the Achaemenid Empire, as noted in section 'I. The Achaemenid Empire.' It was founded by Cyrus the Great and became one of the largest empires in history.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "Which Persian ruler divided the empire into provinces called satrapies?",
                correctAnswer: "Darius I",
                options: ["Cyrus the Great", "Xerxes I", "Darius I", "Darius III"],
                explanation: "As mentioned in section 'I. The Achaemenid Empire,' Darius I divided the empire into satrapies (provinces) that were ruled by satraps (governors) to better manage the vast territories.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "Which of the following was built by the Persians for trade and communication?",
                correctAnswer: "Royal Road",
                options: ["Great Wall", "Royal Road", "Silk Road", "Appian Way"],
                explanation: "Darius I built the Royal Road, which stretched 1,500 miles across the empire and facilitated trade and communication, as noted in section 'I. The Achaemenid Empire.'",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What was the state religion of the Sassanian Empire?",
                correctAnswer: "Zoroastrianism",
                options: ["Islam", "Christianity", "Judaism", "Zoroastrianism"],
                explanation: "As stated in section 'III. The Sassanian Empire,' Zoroastrianism became the state religion during the Sassanian period (224-651 CE).",
                empire: .persianEmpire
            )
        ]
        
        // Persian Empire - Medium Questions (5 questions)
        let persianMediumQuestions = [
            TrainingQuestion(
                text: "What policy toward conquered peoples did Cyrus the Great implement?",
                correctAnswer: "Religious tolerance",
                options: ["Forced conversion", "Religious tolerance", "Mass deportation", "Enslavement"],
                explanation: "Cyrus the Great practiced religious tolerance, allowing conquered peoples to maintain their customs and religions. As noted in section 'I. The Achaemenid Empire,' he permitted Jews to return to Jerusalem after their Babylonian exile.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What significant battle marked a defeat for Xerxes I against the Greeks?",
                correctAnswer: "Battle of Salamis",
                options: ["Battle of Gaugamela", "Battle of Thermopylae", "Battle of Salamis", "Battle of Plataea"],
                explanation: "As mentioned in section 'I. The Achaemenid Empire,' Xerxes I was defeated by the Greeks at the naval Battle of Salamis in 480 BCE during his invasion of Greece.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What major infrastructure system helped Persia manage its vast empire?",
                correctAnswer: "Postal system",
                options: ["Aqueducts", "Postal system", "Stone bridges", "Great Wall"],
                explanation: "As mentioned in section 'I. The Achaemenid Empire,' Darius I created a postal system alongside the Royal Road to facilitate communication across the vast empire. This is also listed as part of the Persian legacy.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "Who was responsible for the fall of the Achaemenid Empire?",
                correctAnswer: "Alexander the Great",
                options: ["Julius Caesar", "Genghis Khan", "Alexander the Great", "Attila the Hun"],
                explanation: "As stated in section 'II. Persian Wars & Decline,' Alexander the Great invaded Persia, defeated Darius III, and burned Persepolis in 330 BCE, leading to the collapse of the Achaemenid Empire.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What were the qanats mentioned in the Persian legacy?",
                correctAnswer: "Underground irrigation systems",
                options: ["Military formations", "Underground irrigation systems", "Religious temples", "Trade guilds"],
                explanation: "As mentioned in section 'IV. Persian Legacy,' qanats were underground irrigation systems that were part of Persian infrastructure achievements, alongside roads and the postal system.",
                empire: .persianEmpire
            )
        ]
        
        // Persian Empire - Hard Questions (5 questions)
        let persianHardQuestions = [
            TrainingQuestion(
                text: "What conflict significantly weakened both the Sassanian Empire and its rival?",
                correctAnswer: "Wars with the Byzantine Empire",
                options: ["Civil wars within Persia", "Wars with the Byzantine Empire", "Conflicts with nomadic tribes", "Trade disputes with India"],
                explanation: "As mentioned in section 'III. The Sassanian Empire,' wars with Rome and Byzantium significantly weakened the Sassanian Empire, eventually making it vulnerable to Arab conquest.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What event marked the end of the Sassanian Empire?",
                correctAnswer: "Conquest by Arab Muslim armies in 651 CE",
                options: ["Conquest by Mongol forces", "Conquest by Arab Muslim armies in 651 CE", "Internal revolution", "Natural disaster"],
                explanation: "As stated in section 'III. The Sassanian Empire,' Arab Muslim armies conquered Persia in 651 CE, bringing an end to the Sassanian Empire and Persian independence for several centuries.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "Which famous battle was fought between the Persians and Greeks at a narrow coastal pass?",
                correctAnswer: "Battle of Thermopylae",
                options: ["Battle of Marathon", "Battle of Salamis", "Battle of Thermopylae", "Battle of Plataea"],
                explanation: "As mentioned in section 'II. Persian Wars & Decline,' the Battle of Thermopylae (480 BCE) was one of the major battles of the Persian Wars, where a small Greek force temporarily held off the massive Persian army at a narrow coastal pass.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What was a lasting influence of Zoroastrianism according to the reading?",
                correctAnswer: "It influenced later religions like Judaism, Christianity, and Islam",
                options: ["It spread throughout Europe", "It influenced later religions like Judaism, Christianity, and Islam", "It disappeared without any legacy", "It became the dominant world religion"],
                explanation: "As mentioned in section 'IV. Persian Legacy,' Zoroastrianism influenced later religions including Judaism, Christianity, and Islam, particularly with concepts like monotheism, good versus evil, and judgment after death.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What strategy did Darius I use to effectively govern the vast Persian Empire?",
                correctAnswer: "He divided it into satrapies with appointed governors",
                options: ["He allowed complete local autonomy", "He divided it into satrapies with appointed governors", "He ruled directly with no delegation", "He established a democratic system"],
                explanation: "As mentioned in section 'I. The Achaemenid Empire,' Darius I divided the empire into satrapies (provinces) ruled by satraps (governors) as an effective administrative strategy to manage the vast territories of the Persian Empire.",
                empire: .persianEmpire
            )
        ]
        
        // Persian Empire - Expert Questions (5 questions)
        let persianExpertQuestions = [
            TrainingQuestion(
                text: "How did the Persian governance model under Cyrus and Darius differ from other ancient empires?",
                correctAnswer: "It combined centralized authority with local autonomy and religious tolerance",
                options: ["It was purely despotic with no administrative structure", "It combined centralized authority with local autonomy and religious tolerance", "It was the first democratic system in the Middle East", "It relied exclusively on military control with no civilian administration"],
                explanation: "As described in sections about Cyrus and Darius, the Persian governance model uniquely combined strong central authority (roads, currency, postal system) with respect for local customs and religious practices, differing from the more assimilationist policies of other ancient empires.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What was the strategic significance of the Persian Royal Road?",
                correctAnswer: "It enabled rapid communication, troop movement, and trade across the vast empire",
                options: ["It was purely ceremonial with no practical purpose", "It enabled rapid communication, troop movement, and trade across the vast empire", "It was built only for religious pilgrimages", "It connected Persia exclusively to India"],
                explanation: "The Royal Road, as mentioned in section 'I. The Achaemenid Empire,' stretched 1,500 miles and, combined with the postal system, allowed for efficient governance, rapid communication, military movement, and trade across the vast Persian territories.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What were the long-term consequences of the Persian Wars with Greece?",
                correctAnswer: "They weakened Persian influence in the Mediterranean and set the stage for Alexander's conquest",
                options: ["They led to immediate Persian collapse", "They strengthened Persian control over Greece", "They weakened Persian influence in the Mediterranean and set the stage for Alexander's conquest", "They had no significant impact on either civilization"],
                explanation: "The Persian Wars, described in section 'II. Persian Wars & Decline,' resulted in Persian defeats that checked their western expansion, preserved Greek independence, and exposed vulnerabilities that Alexander would later exploit in his conquest of the Persian Empire.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "How did the transition from Achaemenid to Sassanian Empire represent a shift in Persian civilization?",
                correctAnswer: "It marked a revival of Persian identity with Zoroastrianism as a state religion",
                options: ["It marked a complete break with earlier Persian traditions", "It represented foreign domination of Persian territories", "It marked a revival of Persian identity with Zoroastrianism as a state religion", "It showed the Persian adoption of Greek culture"],
                explanation: "The Sassanian Empire (224-651 CE), as described in section 'III,' represented a Persian revival after periods of Greek and Parthian rule, with a stronger emphasis on Persian identity and Zoroastrianism as a state religion, in contrast to the more multicultural approach of the Achaemenids.",
                empire: .persianEmpire
            ),
            TrainingQuestion(
                text: "What cultural and technological achievements best demonstrate the Persian Empire's impact on world history?",
                correctAnswer: "Administrative systems, irrigation technology, and religious concepts",
                options: ["Military tactics and weapons only", "Administrative systems, irrigation technology, and religious concepts", "Their achievements had no lasting impact", "Mainly architectural monuments with little practical influence"],
                explanation: "As detailed in section 'IV. Persian Legacy,' the Persian Empire's most enduring impacts included sophisticated administrative systems (satrapies, roads, postal service), advanced irrigation technology (qanats), and religious/philosophical concepts that influenced Judaism, Christianity, and Islam.",
                empire: .persianEmpire
            )
        ]
        
        // Egyptian Empire - Easy Questions (5 questions)
        let egyptianEasyQuestions = [
            TrainingQuestion(
                text: "Who united Upper and Lower Egypt around 3100 BCE?",
                correctAnswer: "Pharaoh Narmer (Menes)",
                options: ["Ramses II", "Tutankhamun", "Pharaoh Narmer (Menes)", "Cleopatra"],
                explanation: "As mentioned in section 'I. Early Egypt & Unification,' Pharaoh Narmer (also known as Menes) united Upper and Lower Egypt around 3100 BCE, creating the first Egyptian dynasty.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What river was essential to Ancient Egypt's development?",
                correctAnswer: "Nile River",
                options: ["Tigris River", "Euphrates River", "Nile River", "Jordan River"],
                explanation: "As stated in section 'I. Early Egypt & Unification,' Ancient Egypt developed along the Nile River, which provided fertile land for agriculture and served as a transportation route.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was built during Egypt's Old Kingdom period?",
                correctAnswer: "Great Pyramid of Giza",
                options: ["Great Wall", "Great Pyramid of Giza", "Sphinx of Thebes", "Temple of Artemis"],
                explanation: "As mentioned in section 'II. The Old Kingdom,' the Great Pyramid of Giza was built around 2580 BCE for Pharaoh Khufu during the period known as the 'Age of the Pyramids.'",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was hieroglyphics used for in ancient Egypt?",
                correctAnswer: "Religious texts and record-keeping",
                options: ["Only for decoration", "Religious texts and record-keeping", "Military communication", "Trade agreements only"],
                explanation: "As noted in section 'I. Early Egypt & Unification,' hieroglyphics was an early writing system used for religious texts and record-keeping in ancient Egypt.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "Who was Egypt's first female pharaoh?",
                correctAnswer: "Hatshepsut",
                options: ["Cleopatra", "Nefertiti", "Hatshepsut", "Isis"],
                explanation: "As mentioned in section 'IV. The New Kingdom,' Hatshepsut (r. 1479-1458 BCE) was the first female pharaoh and encouraged trade with the land of Punt during her reign.",
                empire: .egyptianEmpire
            )
        ]
        
        // Egyptian Empire - Medium Questions (5 questions)
        let egyptianMediumQuestions = [
            TrainingQuestion(
                text: "What major achievement did Ramses II accomplish through diplomacy?",
                correctAnswer: "Signed the first known peace treaty",
                options: ["Unified all of Africa", "Created an alliance with Rome", "Conquered Mesopotamia", "Signed the first known peace treaty"],
                explanation: "As mentioned in section 'IV. The New Kingdom,' Ramses II fought the Hittites at the Battle of Kadesh and then signed what is considered the first known peace treaty in history.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What foreign group invaded Egypt during the Middle Kingdom using superior military technology?",
                correctAnswer: "Hyksos",
                options: ["Romans", "Persians", "Hyksos", "Nubians"],
                explanation: "As stated in section 'III. The Middle Kingdom,' the Hyksos invasion around 1650 BCE brought foreign rulers who took control using advanced military technology like chariots and bronze weapons.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was the Book of the Dead used for in ancient Egyptian culture?",
                correctAnswer: "Guide for the soul's journey after death",
                options: ["Recording historical events", "Teaching mathematics", "Guide for the soul's journey after death", "Recording trade agreements"],
                explanation: "As mentioned in section 'V. Egyptian Religion & Culture,' the Book of the Dead served as a guide for the soul's journey through the afterlife, reflecting Egyptian beliefs about death and immortality.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "Who founded the city of Alexandria in Egypt?",
                correctAnswer: "Alexander the Great",
                options: ["Cleopatra", "Julius Caesar", "Alexander the Great", "Ptolemy I"],
                explanation: "As noted in section 'VI. Decline & Foreign Rule,' Alexander the Great conquered Egypt in 332 BCE and founded the city of Alexandria, which would become a major center of Hellenistic culture.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was the role of viziers in ancient Egypt?",
                correctAnswer: "Managing tax collection and irrigation projects",
                options: ["Leading religious ceremonies", "Managing tax collection and irrigation projects", "Commanding the army", "Building pyramids"],
                explanation: "As mentioned in section 'II. The Old Kingdom,' the Egyptian bureaucracy developed with viziers who managed tax collection and irrigation projects, serving as high officials under the pharaoh.",
                empire: .egyptianEmpire
            )
        ]
        
        // Egyptian Empire - Hard Questions (5 questions)
        let egyptianHardQuestions = [
            TrainingQuestion(
                text: "What caused the collapse of Egypt's Old Kingdom?",
                correctAnswer: "Famine, weak leadership, and civil wars",
                options: ["Foreign invasion", "Natural disasters", "Famine, weak leadership, and civil wars", "Religious conflicts"],
                explanation: "As stated in section 'II. The Old Kingdom,' the Old Kingdom collapsed due to a combination of famine, weak leadership, and civil wars, ending the first great period of Egyptian civilization.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "How did Ahmose I change Egypt's history at the start of the New Kingdom?",
                correctAnswer: "He expelled the Hyksos and expanded Egypt's borders",
                options: ["He invented hieroglyphics", "He expelled the Hyksos and expanded Egypt's borders", "He built the first pyramid", "He established trade with Rome"],
                explanation: "As mentioned in section 'IV. The New Kingdom,' Ahmose I expelled the Hyksos rulers at the beginning of the New Kingdom period and expanded Egypt's borders, establishing a true Egyptian empire.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was the significance of the Battle of Kadesh around 1274 BCE?",
                correctAnswer: "It led to the first recorded peace treaty between major powers",
                options: ["It marked the end of Egyptian independence", "It led to the first recorded peace treaty between major powers", "It established Egypt as the dominant Mediterranean power", "It introduced iron weapons to Egypt"],
                explanation: "As noted in section 'IV. The New Kingdom,' Ramses II fought the Hittites at the Battle of Kadesh, which resulted in the first known peace treaty in history—a significant diplomatic achievement.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What was the Ptolemaic period in Egyptian history?",
                correctAnswer: "Greek rule of Egypt from 323-30 BCE",
                options: ["The peak of native Egyptian power", "Greek rule of Egypt from 323-30 BCE", "A period of Persian domination", "The time of pyramid construction"],
                explanation: "As mentioned in section 'VI. Decline & Foreign Rule,' the Ptolemaic period (323-30 BCE) was when Egypt was ruled by Greek rulers, beginning with Ptolemy (one of Alexander's generals) and ending with Cleopatra VII.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What happened to Egypt after Cleopatra's defeat?",
                correctAnswer: "It became a Roman province",
                options: ["It regained independence", "It became a Persian territory", "It became a Roman province", "It was divided between several rulers"],
                explanation: "As stated in section 'VI. Decline & Foreign Rule,' after Cleopatra's defeat in 30 BCE, Egypt became a Roman province, ending over 3,000 years of native Egyptian rule and independence.",
                empire: .egyptianEmpire
            )
        ]
        
        // Egyptian Empire - Expert Questions (5 questions)
        let egyptianExpertQuestions = [
            TrainingQuestion(
                text: "How did Egypt's geography shape its development as a civilization?",
                correctAnswer: "The Nile provided fertile land, transportation, and natural isolation",
                options: ["Mountain ranges protected it from invasion", "The Nile provided fertile land, transportation, and natural isolation", "Coastal location gave it naval dominance", "Desert climate created resilient population"],
                explanation: "As described in section 'I. Early Egypt & Unification,' Egypt's development was fundamentally shaped by the Nile River, which provided fertile land for agriculture, transportation routes, and along with surrounding deserts, created a naturally isolated and protected environment for Egyptian civilization to develop.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "How did Egyptian religious beliefs influence their political structure?",
                correctAnswer: "Pharaohs were considered living gods, giving them absolute power",
                options: ["Religion was separate from governance", "Priests controlled the government", "Pharaohs were considered living gods, giving them absolute power", "Religious councils limited royal authority"],
                explanation: "As mentioned in section 'I. Early Egypt & Unification,' pharaohs were considered living gods who ruled with absolute power. This theological concept of divine kingship was central to Egypt's political structure and legitimized the pharaoh's authority.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What pattern can be observed in the rise and fall of Egyptian kingdoms?",
                correctAnswer: "Periods of centralization followed by fragmentation due to internal and external pressures",
                options: ["Continuous growth with no significant declines", "Periods of centralization followed by fragmentation due to internal and external pressures", "Regular overthrow by popular revolts", "Cyclical changes based on religious reforms"],
                explanation: "The reading outlines how Egypt experienced distinct periods (Old, Middle, and New Kingdoms) each characterized by initial centralization and achievement, followed by decline due to combinations of internal problems (famine, weak leadership, civil wars) and external threats (Hyksos, foreign invasions), showing a cyclical pattern in Egyptian history.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "How did Egypt's relationship with foreign powers evolve from the New Kingdom to the Late Period?",
                correctAnswer: "From Egyptian dominance to becoming dominated by foreign powers",
                options: ["Egypt remained isolated throughout its history", "From Egyptian dominance to becoming dominated by foreign powers", "Egypt maintained consistent alliances with all neighbors", "Foreign relations were limited to trade only"],
                explanation: "As described across sections IV and VI, Egypt evolved from an expansionist empire during the New Kingdom (conquering parts of Nubia and the Middle East) to gradually becoming dominated by foreign powers (Persians, Greeks, Romans) during the Late Period, representing a complete reversal in its international position.",
                empire: .egyptianEmpire
            ),
            TrainingQuestion(
                text: "What aspects of Egyptian civilization have had the most enduring impact on world history?",
                correctAnswer: "Architectural techniques, mathematical concepts, and cultural symbolism",
                options: ["Political system and governance model", "Architectural techniques, mathematical concepts, and cultural symbolism", "Military tactics and weapons", "Agricultural methods"],
                explanation: "As outlined in section 'VII. Egyptian Legacy,' Egypt's most enduring contributions include its monumental architecture (pyramids, temples), mathematical and medical knowledge (early algebra, surgical tools), writing system (hieroglyphics influencing later scripts), and cultural symbols that continue to fascinate and influence modern society.",
                empire: .egyptianEmpire
            )
        ]
        
        // Chinese Empire - Easy Questions (5 questions)
        let chineseEasyQuestions = [
            TrainingQuestion(
                text: "What was the earliest form of Chinese writing?",
                correctAnswer: "Oracle bones",
                options: ["Pictographs", "Oracle bones", "Calligraphy", "Bamboo scripts"],
                explanation: "As mentioned in the Shang Dynasty section of the reading, oracle bones were the earliest form of Chinese writing, used for divination and record-keeping.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "Who unified China after the Warring States Period?",
                correctAnswer: "Qin Shi Huangdi",
                options: ["Kublai Khan", "Qin Shi Huangdi", "Emperor Wudi", "Confucius"],
                explanation: "As stated in the Qin Dynasty section, Qin Shi Huangdi unified China after the Warring States Period, creating the first centralized Chinese empire in 221 BCE.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What significant structure did the Qin Dynasty build?",
                correctAnswer: "The first Great Wall",
                options: ["The Forbidden City", "The first Great Wall", "The Terracotta Army", "The Grand Canal"],
                explanation: "As mentioned in the Qin Dynasty section, they built the first Great Wall as a defensive structure, though the Qin also created the Terracotta Army for the emperor's tomb.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What important trade route connected China to Rome and India?",
                correctAnswer: "The Silk Road",
                options: ["The Tea Route", "The Grand Canal", "The Silk Road", "The Spice Route"],
                explanation: "As noted in the Han Dynasty section, the Silk Road trade expanded during this period, linking China to Rome and India and facilitating cultural and economic exchange.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What important invention originated in China during the Han Dynasty?",
                correctAnswer: "Paper",
                options: ["Compass", "Paper", "Printing", "Gunpowder"],
                explanation: "As mentioned in the Han Dynasty section, paper was invented during this period, which would become a crucial technology for record-keeping and knowledge transmission.",
                empire: .chineseEmpire
            )
        ]
        
        // Chinese Empire - Medium Questions (5 questions)
        let chineseMediumQuestions = [
            TrainingQuestion(
                text: "What was the Mandate of Heaven in Chinese political thought?",
                correctAnswer: "The belief that rulers were divinely chosen but could be overthrown if unjust",
                options: ["The requirement that emperors perform religious ceremonies", "The belief that rulers were divinely chosen but could be overthrown if unjust", "The system of hereditary succession", "The emperor's right to absolute power"],
                explanation: "As described in the Zhou Dynasty section, the Mandate of Heaven was the belief that rulers were divinely chosen but could lose divine favor and be overthrown if they ruled unjustly.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "Which Chinese dynasty introduced the Civil Service Examination system?",
                correctAnswer: "Han Dynasty",
                options: ["Tang Dynasty", "Qin Dynasty", "Han Dynasty", "Ming Dynasty"],
                explanation: "As mentioned in the Han Dynasty section, the Civil Service Examination was introduced during this period as a way to select government officials based on merit rather than family connections.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What inventions emerged during the Tang Dynasty?",
                correctAnswer: "Gunpowder and block printing",
                options: ["Paper money and compass", "Gunpowder and block printing", "Paper and porcelain", "Mechanical clock and abacus"],
                explanation: "As stated in the Tang Dynasty section, gunpowder and block printing were invented during this culturally innovative period in Chinese history.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "Who was the Mongol leader who conquered China and established the Yuan Dynasty?",
                correctAnswer: "Kublai Khan",
                options: ["Genghis Khan", "Kublai Khan", "Ögedei Khan", "Timur"],
                explanation: "As mentioned in the section on Mongol Rule, Kublai Khan, who was Genghis Khan's grandson, conquered Song China and established the Yuan Dynasty in 1271.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What naval achievement occurred during the Ming Dynasty?",
                correctAnswer: "Admiral Zheng He led naval expeditions to Africa and the Middle East",
                options: ["China established colonies in the Americas", "Admiral Zheng He led naval expeditions to Africa and the Middle East", "The Chinese navy defeated European warships", "The first Chinese submarines were built"],
                explanation: "As noted in the Ming Dynasty section, Admiral Zheng He led massive naval expeditions that reached Africa and the Middle East, demonstrating China's maritime capabilities before a period of isolationism began.",
                empire: .chineseEmpire
            )
        ]
        
        // Chinese Empire - Hard Questions (5 questions)
        let chineseHardQuestions = [
            TrainingQuestion(
                text: "What philosophical systems emerged during the Zhou Dynasty?",
                correctAnswer: "Confucianism and Daoism",
                options: ["Buddhism and Shintoism", "Confucianism and Daoism", "Legalism and Mohism", "Neo-Confucianism and Buddhism"],
                explanation: "As mentioned in the Zhou Dynasty section, Confucianism and Daoism emerged during this period, establishing philosophical frameworks that would influence Chinese thought for millennia.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What governing philosophy did the Qin Dynasty implement?",
                correctAnswer: "Legalism",
                options: ["Confucianism", "Daoism", "Legalism", "Buddhism"],
                explanation: "As stated in the Qin Dynasty section, Legalism was the governing philosophy, which emphasized strict laws and harsh punishments to maintain order in the empire.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What innovations during the Song Dynasty improved trade?",
                correctAnswer: "Paper money, porcelain, and the compass",
                options: ["Silk production and bronze casting", "Paper money, porcelain, and the compass", "Gunpowder weapons and armor", "Agricultural techniques and irrigation"],
                explanation: "As mentioned in the Song Dynasty section, paper money, porcelain, and the compass were key innovations that improved trade during this economically advanced period.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What policy did the Mongols implement regarding Chinese officials during the Yuan Dynasty?",
                correctAnswer: "They excluded Chinese from top government positions",
                options: ["They appointed only Chinese officials", "They excluded Chinese from top government positions", "They required all officials to be bilingual", "They eliminated the civil service examination"],
                explanation: "As noted in the section on Mongol Rule, the Yuan Dynasty excluded Chinese from top government positions, which contributed to Chinese resentment and eventual overthrow of Mongol rule.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What event in the 19th century demonstrated China's vulnerability to Western powers?",
                correctAnswer: "The Opium Wars",
                options: ["The Boxer Rebellion", "The Taiping Rebellion", "The Opium Wars", "The 1911 Revolution"],
                explanation: "As mentioned in the Qing Dynasty section, the Opium Wars (1839-1842, 1856-1860) resulted from limited European trade policies and demonstrated China's military weakness against industrialized Western powers.",
                empire: .chineseEmpire
            )
        ]
        
        // Chinese Empire - Expert Questions (5 questions)
        let chineseExpertQuestions = [
            TrainingQuestion(
                text: "How did China's governance model evolve from the Zhou Dynasty to the Qin and Han Dynasties?",
                correctAnswer: "From feudalism to centralized bureaucratic empire",
                options: ["From democracy to monarchy", "From centralization to local autonomy", "From feudalism to centralized bureaucratic empire", "From military dictatorship to constitutional monarchy"],
                explanation: "The reading shows how China evolved from the Zhou's feudal system (land controlled by local lords) to the Qin's centralized control under Legalism, and finally to the Han's bureaucratic system with the Civil Service Exam—representing a shift from feudalism to centralized imperial governance.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What was the historical significance of China's cycle of unity and fragmentation?",
                correctAnswer: "It created a pattern where each reunification reinforced Chinese cultural identity",
                options: ["It prevented China from developing a consistent culture", "It created a pattern where each reunification reinforced Chinese cultural identity", "It led to permanent regional differences that persist today", "It caused China to be continually conquered by outside powers"],
                explanation: "The reading demonstrates how China experienced periods of unity (Qin, Han, Tang, Song, Ming, Qing) and fragmentation, but unlike other regions that permanently split into different nations, China repeatedly reunified, reinforcing a sense of shared cultural identity despite periodic division.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "How did foreign rule (Mongol and Manchu) impact Chinese civilization?",
                correctAnswer: "Foreign rulers adopted Chinese administrative systems while introducing their own cultural elements",
                options: ["It completely destroyed traditional Chinese culture", "Foreign rulers adopted Chinese administrative systems while introducing their own cultural elements", "It had minimal impact as foreigners were quickly assimilated", "It resulted in Chinese culture being exported throughout Asia"],
                explanation: "As shown in the sections on the Yuan and Qing dynasties, foreign rulers (Mongols and Manchus) maintained many Chinese institutional systems but implemented distinct policies (excluding Chinese from leadership, expanding borders) and introduced new cultural elements, creating a complex cultural integration.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "What key factors led to the decline of the Qing Dynasty in the 19th and early 20th centuries?",
                correctAnswer: "Internal rebellions, Western imperialism, and failure to modernize",
                options: ["Natural disasters and climate change", "Economic prosperity leading to complacency", "Internal rebellions, Western imperialism, and failure to modernize", "Successful democratic movements"],
                explanation: "The Qing Dynasty section details how the combination of internal challenges (Taiping and Boxer Rebellions), confrontations with Western powers (Opium Wars), and inability to effectively modernize ultimately led to the 1911 Revolution and the end of imperial China after more than 2,000 years.",
                empire: .chineseEmpire
            ),
            TrainingQuestion(
                text: "How did technological innovation throughout Chinese history reflect different dynasties' priorities?",
                correctAnswer: "Different eras prioritized military, administrative, or commercial technologies based on their political needs",
                options: ["Innovation occurred randomly with no pattern", "Different eras prioritized military, administrative, or commercial technologies based on their political needs", "Technology only advanced during periods of foreign contact", "All Chinese dynasties prioritized military technology above all else"],
                explanation: "The reading shows how different dynasties prioritized different technologies: Qin standardized writing and measurements for administration, Han invented paper for record-keeping, Tang developed printing and gunpowder, and Song created commercial innovations like paper money and improved compass—each reflecting their era's priorities and challenges.",
                empire: .chineseEmpire
            )
        ]
        
        // Aztec Empire - Easy Questions (5 questions)
        let aztecEasyQuestions = [
            TrainingQuestion(
                text: "Where did the Aztecs build their capital city Tenochtitlán?",
                correctAnswer: "On an island in Lake Texcoco",
                options: ["In the mountains", "On an island in Lake Texcoco", "Along the Pacific coast", "In the Yucatan peninsula"],
                explanation: "As mentioned in section 'I. Origins & Expansion,' the Aztecs founded Tenochtitlán in 1325 CE on an island in Lake Texcoco in central Mexico.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What were chinampas used for in Aztec society?",
                correctAnswer: "Floating gardens for farming",
                options: ["Military training grounds", "Religious ceremonies", "Floating gardens for farming", "Transportation between islands"],
                explanation: "As noted in sections 'I. Origins & Expansion' and 'III. Economy & Achievements,' chinampas were floating gardens that increased agricultural production and helped sustain the island city of Tenochtitlán.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What was the Triple Alliance?",
                correctAnswer: "Aztecs allied with Texcoco & Tlacopan to dominate the region",
                options: ["A religious trinity of gods", "Aztecs allied with Texcoco & Tlacopan to dominate the region", "An alliance with the Spanish", "Three classes of Aztec society"],
                explanation: "As stated in section 'I. Origins & Expansion,' the Triple Alliance formed in 1428 CE when the Aztecs allied with Texcoco and Tlacopan to dominate the region, establishing the foundation of the Aztec Empire.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "Who was the Spanish conquistador who led the conquest of the Aztec Empire?",
                correctAnswer: "Hernán Cortés",
                options: ["Christopher Columbus", "Hernán Cortés", "Francisco Pizarro", "Montezuma"],
                explanation: "As mentioned in section 'IV. The Spanish Conquest,' Hernán Cortés arrived in 1519 CE with 600 men and ultimately led the conquest of the Aztec Empire.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What did the Aztecs use as currency?",
                correctAnswer: "Cocoa beans",
                options: ["Gold coins", "Jade stones", "Cocoa beans", "Feathers"],
                explanation: "As noted in section 'III. Economy & Achievements,' the Aztecs used a barter system for trade, and cocoa beans served as currency in their economic transactions.",
                empire: .aztecEmpire
            )
        ]
        
        // Aztec Empire - Medium Questions (5 questions)
        let aztecMediumQuestions = [
            TrainingQuestion(
                text: "What was the title of the Aztec emperor?",
                correctAnswer: "Huey Tlatoani",
                options: ["Tlatoani", "Huey Tlatoani", "Calpulli", "Teuctli"],
                explanation: "As mentioned in section 'II. Government & Society,' the Aztec emperor held the title Huey Tlatoani, meaning 'Great Speaker,' and was considered a semi-divine ruler.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What was the main purpose of human sacrifice in Aztec religion?",
                correctAnswer: "To provide blood offerings to keep the sun rising",
                options: ["To predict the future", "To provide blood offerings to keep the sun rising", "To ensure good harvests", "To punish criminals"],
                explanation: "As explained in section 'II. Government & Society,' human sacrifice was performed because the Aztecs believed their god Huitzilopochtli (Sun God) required blood offerings to keep the sun rising each day.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What engineering achievements did the Aztecs accomplish?",
                correctAnswer: "Built causeways, aqueducts, and temples",
                options: ["Built metal weapons", "Constructed sailing ships", "Built causeways, aqueducts, and temples", "Created steam engines"],
                explanation: "As noted in section 'III. Economy & Achievements,' the Aztecs were skilled engineers who built causeways, aqueducts, and temples, including the impressive structures in their capital city.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "How many calendar systems did the Aztecs use?",
                correctAnswer: "Two: a 365-day solar calendar and a 260-day ritual calendar",
                options: ["One: a lunar calendar", "Two: a 365-day solar calendar and a 260-day ritual calendar", "Three: solar, lunar, and ritualistic", "Four: one for each season"],
                explanation: "As mentioned in section 'III. Economy & Achievements,' the Aztecs had two calendar systems: a 365-day solar calendar for agriculture and a 260-day ritual calendar for religious ceremonies.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "Who did Moctezuma II initially believe Cortés might be?",
                correctAnswer: "Quetzalcoatl (a god)",
                options: ["A friendly trader", "Quetzalcoatl (a god)", "A new ally", "A lost explorer"],
                explanation: "As stated in section 'IV. The Spanish Conquest,' Moctezuma II hesitated in his response to Cortés because he thought the Spaniard might be Quetzalcoatl, a god who was prophesied to return.",
                empire: .aztecEmpire
            )
        ]
        
        // Aztec Empire - Hard Questions (5 questions)
        let aztecHardQuestions = [
            TrainingQuestion(
                text: "What was the tribute system in the Aztec Empire?",
                correctAnswer: "A system where conquered cities paid food, goods, and captives",
                options: ["A volunteer tax system", "A system where conquered cities paid food, goods, and captives", "Religious offerings to temples", "Military service requirements"],
                explanation: "As explained in section 'II. Government & Society,' the tribute system was how the Aztecs managed their empire, requiring conquered cities to pay tributes in the form of food, goods, and captives for sacrifice.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What was the social structure of Aztec society?",
                correctAnswer: "Nobles, warriors, priests, merchants, artisans, farmers, and slaves",
                options: ["Nobles, warriors, priests, merchants, artisans, farmers, and slaves", "Kings, nobles, commoners", "Priests, warriors, farmers", "Men, women, children"],
                explanation: "As detailed in section 'II. Government & Society,' Aztec society was stratified into distinct classes: nobles, warriors, priests, merchants, artisans, farmers, and slaves, each with different roles and privileges.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What factor significantly weakened the Aztecs during the Spanish conquest?",
                correctAnswer: "Smallpox",
                options: ["Drought", "Civil war", "Smallpox", "Famine"],
                explanation: "As mentioned in section 'IV. The Spanish Conquest,' smallpox, a disease introduced by the Europeans, significantly weakened the Aztecs during the siege of Tenochtitlán in 1521, contributing to their defeat.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "How did Cortés gain an advantage against the much larger Aztec forces?",
                correctAnswer: "By allying with enemies of the Aztecs like the Tlaxcalans",
                options: ["By having superior weapons", "By allying with enemies of the Aztecs like the Tlaxcalans", "By attacking at night", "By poisoning their water supply"],
                explanation: "As noted in section 'IV. The Spanish Conquest,' Cortés gained a crucial advantage by allying with enemies of the Aztecs, such as the Tlaxcalans, who had long resented Aztec dominance.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What happened to Tenochtitlán after the Spanish conquest?",
                correctAnswer: "It was destroyed and Mexico City was built in its place",
                options: ["It was preserved as a historical site", "It was abandoned and fell into ruin", "It was destroyed and Mexico City was built in its place", "It was converted into a Spanish fortress"],
                explanation: "As stated in section 'IV. The Spanish Conquest,' the Spanish destroyed Tenochtitlán after conquering it and built Mexico City in its place, though many Aztec structures were used as foundations.",
                empire: .aztecEmpire
            )
        ]
        
        // Aztec Empire - Expert Questions (5 questions)
        let aztecExpertQuestions = [
            TrainingQuestion(
                text: "How did the geography of central Mexico influence the development of Aztec civilization?",
                correctAnswer: "The lake environment allowed for chinampas agriculture and strategic defense",
                options: ["Mountains provided natural resources and protection", "The lake environment allowed for chinampas agriculture and strategic defense", "Coastal access facilitated trade with other civilizations", "Desert conditions required advanced irrigation"],
                explanation: "As implied throughout the reading, the Aztecs strategically built Tenochtitlán on an island in Lake Texcoco, which provided both agricultural advantages through chinampas (floating gardens) and natural defensive protection against enemies, fundamentally shaping their civilization's development.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "How did the Aztec tribute system contribute to both the strength and weakness of their empire?",
                correctAnswer: "It provided wealth but created resentful enemies who allied with the Spanish",
                options: ["It only provided economic benefits with no drawbacks", "It provided wealth but created resentful enemies who allied with the Spanish", "It weakened the empire by giving too much autonomy to subjects", "It was purely ceremonial with little practical impact"],
                explanation: "While the reading mentions that the tribute system brought wealth to the Aztec Empire, it also created resentment among conquered peoples, which Cortés exploited by allying with enemies of the Aztecs like the Tlaxcalans—showing how this system was both a source of strength and ultimately a fatal weakness.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "How did Aztec religious practices shape their political and military policies?",
                correctAnswer: "The need for sacrificial captives drove military expansion and conquest",
                options: ["Religion was kept separate from politics", "The need for sacrificial captives drove military expansion and conquest", "Religious leaders controlled the emperors", "Military conquests were forbidden by religious doctrine"],
                explanation: "The reading shows how Aztec religion, particularly the belief that Huitzilopochtli required human sacrifices to keep the sun rising, directly influenced their military policies by creating a constant need for captives, thus driving expansion and the tribute system.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "What combination of factors best explains the rapid fall of the powerful Aztec Empire to a relatively small Spanish force?",
                correctAnswer: "Indigenous alliances, disease, technological differences, and cultural misunderstandings",
                options: ["Military superiority of Spanish forces alone", "Indigenous alliances, disease, technological differences, and cultural misunderstandings", "Aztec religious prophecies causing surrender", "Civil war within the Aztec Empire"],
                explanation: "The reading reveals that the Aztec defeat resulted from a complex combination of factors: Cortés forming alliances with the Aztecs' enemies, devastating smallpox epidemics, Spanish technological advantages (steel, horses, gunpowder), and Moctezuma's hesitation due to religious beliefs about Quetzalcoatl's return.",
                empire: .aztecEmpire
            ),
            TrainingQuestion(
                text: "How does the Aztec legacy continue to influence modern Mexican culture?",
                correctAnswer: "Through language, cultural practices like Day of the Dead, and national identity",
                options: ["It has no significant influence today", "Only through museum artifacts", "Through language, cultural practices like Day of the Dead, and national identity", "Only through tourism promotion"],
                explanation: "As described in section 'V. Aztec Legacy,' Aztec influence continues in modern Mexico through the Nahuatl language still spoken today, cultural practices like the Day of the Dead (Día de los Muertos) which has Aztec roots, and artistic and architectural traditions that form part of Mexico's national identity.",
                empire: .aztecEmpire
            )
        ]
        
        // Return all questions for all empires
        return romanEasyQuestions + romanMediumQuestions + romanHardQuestions + romanExpertQuestions + 
               byzantineEasyQuestions + byzantineMediumQuestions + byzantineHardQuestions + byzantineExpertQuestions +
               mongolEasyQuestions + mongolMediumQuestions + mongolHardQuestions + mongolExpertQuestions +
               ottomanEasyQuestions + ottomanMediumQuestions + ottomanHardQuestions + ottomanExpertQuestions +
               persianEasyQuestions + persianMediumQuestions + persianHardQuestions + persianExpertQuestions +
               egyptianEasyQuestions + egyptianMediumQuestions + egyptianHardQuestions + egyptianExpertQuestions +
               chineseEasyQuestions + chineseMediumQuestions + chineseHardQuestions + chineseExpertQuestions +
               aztecEasyQuestions + aztecMediumQuestions + aztecHardQuestions + aztecExpertQuestions
    }
    
    // Filter questions by empire
    static func getQuestions(for empires: [Empire]) -> [TrainingQuestion] {
        let allQuestions = sampleQuestions()
        if empires.isEmpty {
            return allQuestions
        }
        return allQuestions.filter { empires.contains($0.empire) }
    }
}

struct TrainingSessionView: View {
    // Parameters from setup
    let selectedEmpires: [Empire]
    let timeSeconds: Int
    let difficultyLevel: String
    
    // Environment
    @Environment(\.dismiss) private var dismiss
    
    // State
    @State private var questions: [TrainingQuestion] = []
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var timeRemaining: Int
    @State private var selectedAnswer: String?
    @State private var showExplanation = false
    @State private var isSessionComplete = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var currentQuestion: TrainingQuestion? {
        guard questions.indices.contains(currentQuestionIndex) else { 
            return nil 
        }
        return questions[currentQuestionIndex]
    }
    
    var progress: CGFloat {
        guard !questions.isEmpty else { return 0 }
        return CGFloat(currentQuestionIndex) / CGFloat(questions.count)
    }
    
    // Accept primitive types to avoid type conflicts
    init(selectedEmpires: [Empire], timeOption: Int, difficulty: String) {
        self.selectedEmpires = selectedEmpires
        self.timeSeconds = timeOption
        self.difficultyLevel = difficulty
        _timeRemaining = State(initialValue: timeOption)
    }
    
    var body: some View {
        ZStack {
            // Main content
            VStack {
                // Timer and score
                HStack {
                    // Timer
                    HStack {
                        Image(systemName: "clock")
                        Text("\(timeRemaining)")
                            .font(.headline)
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    Spacer()
                    
                    // Score
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(score)")
                            .font(.headline)
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Progress bar
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .padding(.horizontal)
                
                if let question = currentQuestion {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Question
                            Text(question.text)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            
                            // Options
                            ForEach(question.options, id: \.self) { option in
                                Button(action: {
                                    if !showExplanation {
                                        selectedAnswer = option
                                        showExplanation = true
                                        
                                        if option == question.correctAnswer {
                                            score += 1
                                        }
                                    }
                                }) {
                                    HStack {
                                        Text(option)
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                        
                                        if showExplanation {
                                            if option == question.correctAnswer {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundColor(.green)
                                            } else if option == selectedAnswer {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(.systemGray6))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: option == selectedAnswer ? 2 : 1)
                                    )
                                }
                            }
                            
                            // Explanation
                            if showExplanation {
                                Text("Explanation:")
                                    .font(.headline)
                                    .padding(.top)
                                
                                Text(question.explanation)
                                    .padding()
                                    .background(Color(.systemGray6).opacity(0.5))
                                    .cornerRadius(10)
                                
                                Button(action: {
                                    // Move to next question or end
                                    showExplanation = false
                                    selectedAnswer = nil
                                    
                                    if currentQuestionIndex + 1 < questions.count {
                                        currentQuestionIndex += 1
                                    } else {
                                        isSessionComplete = true
                                    }
                                }) {
                                    Text("Next")
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                } else if questions.isEmpty {
                    Text("Loading questions...")
                        .font(.headline)
                }
            }
            .padding(.vertical)
            .opacity(isSessionComplete ? 0.3 : 1) // Dim the main content when session is complete
            
            // Summary popup - Using overlay pattern to ensure it appears on top
            if isSessionComplete {
                VStack(spacing: 20) {
                    Text("Time's Up!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Analytics section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Stats:")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Score: \(score)/\(questions.count)")
                        }
                        
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Questions Attempted: \(currentQuestionIndex + 1)/\(questions.count)")
                        }
                        
                        HStack {
                            Image(systemName: "percent")
                            let percentage = questions.isEmpty ? 0 : Double(score) / Double(min(currentQuestionIndex + 1, questions.count)) * 100
                            Text("Accuracy: \(Int(percentage))%")
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    Text(getPerformanceText())
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // Action buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            // Reset the session with the same parameters
                            resetSession()
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Play Again")
                            }
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "xmark")
                                Text("Exit")
                            }
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray5))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(15)
                .shadow(radius: 10)
                .padding(20)
                .transition(.scale)
                .animation(.easeInOut, value: isSessionComplete)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {} // Prevents taps from going through to background
                )
            }
        }
        .onAppear {
            questions = TrainingQuestion.getQuestions(for: selectedEmpires)
            startTimer()
        }
        .onReceive(timer) { _ in
            if timeRemaining <= 0 {
                // Force cancel the timer
                timer.upstream.connect().cancel()
                
                // Force the session to complete
                isSessionComplete = true
                
                return
            }
            
            // Decrement the timer
            timeRemaining -= 1
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    private func getBackgroundColor(for option: String, in question: TrainingQuestion) -> Color {
        if !showExplanation {
            return option == selectedAnswer ? Color.blue.opacity(0.1) : Color(.systemBackground)
        }
        
        if option == question.correctAnswer {
            return Color.green.opacity(0.1)
        }
        
        if option == selectedAnswer && option != question.correctAnswer {
            return Color.red.opacity(0.1)
        }
        
        return Color(.systemBackground)
    }
    
    private func getBorderColor(for option: String, in question: TrainingQuestion) -> Color {
        if !showExplanation {
            return option == selectedAnswer ? Color.blue : Color.gray.opacity(0.3)
        }
        
        if option == question.correctAnswer {
            return Color.green
        }
        
        if option == selectedAnswer && option != question.correctAnswer {
            return Color.red
        }
        
        return Color.gray.opacity(0.3)
    }
    
    private func getPerformanceText() -> String {
        guard !questions.isEmpty else { return "No questions attempted" }
        
        let questionsAttempted = min(currentQuestionIndex, questions.count)
        guard questionsAttempted > 0 else { return "No questions attempted" }
        
        let percentage = Double(score) / Double(questionsAttempted) * 100
        
        if percentage >= 90 {
            return "Outstanding! You are a true Emperor!"
        } else if percentage >= 75 {
            return "Great job! You've mastered these empires!"
        } else if percentage >= 60 {
            return "Good work! Your knowledge is growing!"
        } else if percentage >= 40 {
            return "Keep practicing! You're on your way!"
        } else {
            return "More training needed. Don't give up!"
        }
    }
    
    // Add this function to reset the session
    private func resetSession() {
        // Reset all state
        currentQuestionIndex = 0
        score = 0
        timeRemaining = timeSeconds
        selectedAnswer = nil
        showExplanation = false
        isSessionComplete = false
        
        // Shuffle the questions again for variety
        questions.shuffle()
        
        // Restart the timer
        startTimer()
    }
}

// A simple placeholder structure to avoid model conflicts
struct PlaceholderQuestion {
    let text: String
    let correctAnswer: String
    let options: [String] 
    let explanation: String
    let empire: Empire
}

// Make sure this matches the enum in TrainingSetupView
enum TimeOption: CaseIterable, Hashable {
    case sec10, sec15, sec30, sec45, min1, min1_30, min2
    
    var seconds: Int {
        switch self {
        case .sec10: return 10
        case .sec15: return 15
        case .sec30: return 30
        case .sec45: return 45
        case .min1: return 60
        case .min1_30: return 90
        case .min2: return 120
        }
    }
    
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

// Make sure this matches the enum in TrainingSetupView
enum TrainingDifficulty: String, CaseIterable, Hashable {
    case easy = "Recruit"
    case medium = "Soldier"
    case hard = "Commander"
    case expert = "Emperor"
} 
