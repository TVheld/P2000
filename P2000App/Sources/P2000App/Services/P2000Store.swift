import Foundation
import Combine

class P2000Store: ObservableObject {
    @Published var messages: [P2000Message] = []
    @Published var filter: EmergencyService? = nil

    private var cancellables = Set<AnyCancellable>()
    private let service = P2000Service()

    init() {
        fetchMessages()
    }

    func fetchMessages() {
        service.fetchMessages()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching messages: \(error)")
                }
            }, receiveValue: { [weak self] messages in
                self?.messages = messages
            })
            .store(in: &cancellables)
    }
}
