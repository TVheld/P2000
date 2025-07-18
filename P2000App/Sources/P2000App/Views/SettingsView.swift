import SwiftUI
import MapKit


struct SettingsView: View {
    @AppStorage("language") private var language: String = Locale.current.language.languageCode?.identifier ?? "en"
    @State private var radius: Double = 25

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.1, longitude: 5.1),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    @State private var caching: Bool = true

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Taal")) {
                    Picker("Taal", selection: $language) {
                        Text("Nederlands").tag("nl")
                        Text("English").tag("en")
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Bereik")) {

                    VStack(spacing: 8) {
                        Map(coordinateRegion: $region) {
                            MapCircle(center: region.center, radius: radius * 1000)
                                .foregroundStyle(.blue.opacity(0.3))
                        }
                        .frame(height: 200)
                        .onAppear { updateRegion(for: radius) }

                        HStack {
                            Slider(value: $radius, in: 5...100, step: 5)
                                .onChange(of: radius) { updateRegion(for: $0) }
                            Text("\(Int(radius)) km")
                        }

                    }
                }

                Section(header: Text("Opslag")) {
                    Toggle("Caching", isOn: $caching)
                }
            }
            .navigationTitle("Instellingen")
        }
    }


    private func updateRegion(for value: Double) {
        let spanDegrees = (value / 111.0) * 2
        let newSpan = MKCoordinateSpan(latitudeDelta: spanDegrees,
                                       longitudeDelta: spanDegrees)
        region = MKCoordinateRegion(center: region.center, span: newSpan)
    }

}

#Preview {
    SettingsView()
}
