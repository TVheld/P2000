import Foundation

struct P2000Feed: Decodable {
    let messages: [P2000Message]
}

struct P2000Message: Identifiable, Decodable {
    let id: String
    let title: String
    let service: EmergencyService
    let timestamp: Date
    let latitude: Double?
    let longitude: Double?
    let description: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case service = "service"
        case timestamp = "date"
        case latitude = "latitude"
        case longitude = "longitude"
        case description = "description"
    }
}

enum EmergencyService: String, Decodable, CaseIterable, Identifiable {
    case ambulance = "Ambulance"
    case fire = "Brandweer"
    case police = "Politie"
    case knrm = "KNRM"
    case other = "Overige"

    var id: String { rawValue }
}
