import Foundation

enum Empire: String, Codable, CaseIterable {
    case romanEmpire = "Roman Empire"
    case byzantineEmpire = "Byzantine Empire"
    case mongolEmpire = "Mongol Empire"
    case ottomanEmpire = "Ottoman Empire"
    case persianEmpire = "Persian Empire"
    case egyptianEmpire = "Egyptian Empire"
    case chineseEmpire = "Chinese Empire"
    case aztecEmpire = "Aztec Empire"
    
    var timeRange: String {
        switch self {
        case .romanEmpire: return "27 BC - 476 AD"
        case .byzantineEmpire: return "330 AD - 1453 AD"
        case .mongolEmpire: return "1206 - 1368"
        case .ottomanEmpire: return "1299 - 1922"
        case .persianEmpire: return "550 BC - 330 BC"
        case .egyptianEmpire: return "3150 BC - 30 BC"
        case .chineseEmpire: return "221 BC - 1912 AD"
        case .aztecEmpire: return "1428 - 1521"
        }
    }
    
    // Add banner image for empire cards
    var bannerImage: String {
        switch self {
        case .romanEmpire: return "roman_banner"
        case .byzantineEmpire: return "byzantine_banner"
        case .mongolEmpire: return "mongol_banner"
        case .ottomanEmpire: return "ottomanemp3"
        case .persianEmpire: return "persian_banner"
        case .egyptianEmpire: return "egyptian_banner"
        case .chineseEmpire: return "chinese_banner"
        case .aztecEmpire: return "aztec_banner"
        }
    }
    
    // Add icon image for quick learn cards
    var iconImage: String {
        switch self {
        case .romanEmpire: return "roman_icon"
        case .byzantineEmpire: return "byzantine_icon"
        case .mongolEmpire: return "mongol_icon"
        case .ottomanEmpire: return "ottoman_icon"
        case .persianEmpire: return "persian_icon"
        case .egyptianEmpire: return "egyptian_icon"
        case .chineseEmpire: return "chinese_icon"
        case .aztecEmpire: return "aztec_icon"
        }
    }
} 