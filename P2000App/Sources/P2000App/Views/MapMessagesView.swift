import SwiftUI
import MapKit

struct MapMessagesView: View {
    @EnvironmentObject var store: P2000Store
    @State private var hours: Double = 24
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.1, longitude: 5.1),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: recentMessages) { message in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: message.latitude ?? 0, longitude: message.longitude ?? 0)) {
                    Circle()
                        .strokeBorder(Color.blue, lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .background(Circle().fill(Color.blue.opacity(0.3)))
                }
            }
            .navigationTitle("Meldingen")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Text("\(Int(hours))u")
                        Slider(value: $hours, in: 12...168, step: 12)
                    }
                }
            }
        }
    }

    private var recentMessages: [P2000Message] {
        let cutoff = Date().addingTimeInterval(-hours * 3600)
        return store.messages.filter { $0.timestamp >= cutoff }
    }
}

#Preview {
    MapMessagesView()
        .environmentObject(P2000Store())
}
