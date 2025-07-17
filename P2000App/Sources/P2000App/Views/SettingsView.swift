import SwiftUI

struct SettingsView: View {
    @AppStorage("language") private var language: String = Locale.current.language.languageCode?.identifier ?? "en"
    @State private var radius: Double = 25
    @State private var caching: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Taal")) {
                    Picker("Taal", selection: $language) {
                        Text("Nederlands").tag("nl")
                        Text("English").tag("en")
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Bereik")) {
                    HStack {
                        Slider(value: $radius, in: 5...100, step: 5)
                        Text("\(Int(radius)) km")
                    }
                }

                Section(header: Text("Opslag")) {
                    Toggle("Caching", isOn: $caching)
                }
            }
            .navigationTitle("Instellingen")
        }
    }
}

#Preview {
    SettingsView()
}
