import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "list.bullet")
                }

            MapMessagesView()
                .tabItem {
                    Label("Kaart", systemImage: "map")
                }

            SearchView()
                .tabItem {
                    Label("Zoeken", systemImage: "magnifyingglass")
                }

            SettingsView()
                .tabItem {
                    Label("Instellingen", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(P2000Store())
}
