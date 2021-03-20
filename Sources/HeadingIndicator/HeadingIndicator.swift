import CoreLocation
import SwiftUI

public struct HeadingIndicator<Content: View>: View {
    let currentLocation: CLLocationCoordinate2D
    let currentHeading: CLHeading
    let targetLocation: CLLocationCoordinate2D
    let content: Content

    var targetBearing: Double {
        let deltaL = targetLocation.longitude.radians - currentLocation.longitude.radians
        let thetaB = targetLocation.latitude.radians
        let thetaA = currentLocation.latitude.radians

        let x = cos(thetaB) * sin(deltaL)
        let y = cos(thetaA) * sin(thetaB) - sin(thetaA) * cos(thetaB) * cos(deltaL)
        let bearing = atan2(x, y)

        return bearing.degrees
    }

    var targetHeading: Double {
        targetBearing - currentHeading.magneticHeading
    }

    public init(currentLocation: CLLocationCoordinate2D,
                currentHeading: CLHeading,
                targetLocation: CLLocationCoordinate2D,
                content: Content)
    {
        self.currentLocation = currentLocation
        self.currentHeading = currentHeading
        self.targetLocation = targetLocation
        self.content = content
    }

    public init(currentLocation: CLLocationCoordinate2D,
                currentHeading: CLHeading,
                targetLocation: CLLocationCoordinate2D,
                contentBuilder: () -> Content)
    {
        self.currentLocation = currentLocation
        self.currentHeading = currentHeading
        self.targetLocation = targetLocation
        self.content = contentBuilder()
    }

    public var body: some View {
        content
            .rotationEffect(.degrees(self.targetHeading))
    }
}

struct HeadingIndicator_Previews: PreviewProvider {
    static let berlinCenter = CLLocationCoordinate2D(
        latitude: 52.5145579,
        longitude: 13.366856)

    static let brandenburgGate = CLLocationCoordinate2D(
        latitude: 52.5202008,
        longitude: 13.3478372)

    static var previews: some View {
        HeadingIndicator(
            currentLocation: berlinCenter,
            currentHeading: CLHeading(),
            targetLocation: brandenburgGate) {
                Image(systemName: "arrow.up.circle")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
