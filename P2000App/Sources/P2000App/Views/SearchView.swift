import SwiftUI

struct SearchView: View {
    @EnvironmentObject var store: P2000Store
    @State private var query = ""

    var body: some View {
        NavigationView {
            List(filteredMessages) { message in
                VStack(alignment: .leading) {
                    Text(message.title)
                    Text(message.timestamp, style: .time)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .searchable(text: $query, placement: .automatic)
            .navigationTitle("Zoeken")
        }
    }

    private var filteredMessages: [P2000Message] {
        if query.isEmpty {
            return store.messages
        }
        return store.messages.filter { message in
            message.title.localizedCaseInsensitiveContains(query)
                || message.description?.localizedCaseInsensitiveContains(query) == true
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(P2000Store())
}
