import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: P2000Store

    var body: some View {
        NavigationView {
            List(filteredMessages) { message in
                VStack(alignment: .leading) {
                    Text(message.title)
                        .font(.headline)
                    Text(message.timestamp, style: .time)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Meldingen")
            .toolbar {
                Menu {
                    Button("Alle", action: { store.filter = nil })
                    ForEach(EmergencyService.allCases) { service in
                        Button(service.rawValue, action: { store.filter = service })
                    }
                } label: {
                    Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                }
            }
        }
    }

    private var filteredMessages: [P2000Message] {
        if let filter = store.filter {
            return store.messages.filter { $0.service == filter }
        } else {
            return store.messages
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(P2000Store())
}
