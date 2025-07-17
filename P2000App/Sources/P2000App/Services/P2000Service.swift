import Foundation
import Combine

struct P2000Service {
    private let url = URL(string: "https://feeds.veiligheidsregio.net/feeds/p2000.json")!

    func fetchMessages() -> AnyPublisher<[P2000Message], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: P2000Feed.self, decoder: JSONDecoder())
            .map { $0.messages }
            .eraseToAnyPublisher()
    }
}
