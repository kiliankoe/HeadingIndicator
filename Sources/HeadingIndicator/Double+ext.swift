import Foundation

internal extension Double {
    var radians: Double {
        Measurement(value: self, unit: UnitAngle.degrees)
            .converted(to: .radians)
            .value
    }

    var degrees: Double {
        Measurement(value: self, unit: UnitAngle.radians)
            .converted(to: .degrees)
            .value
    }
}
