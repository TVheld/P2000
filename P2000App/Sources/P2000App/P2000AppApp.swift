import SwiftUI

@main
struct P2000AppApp: App {
    @StateObject private var store = P2000Store()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
