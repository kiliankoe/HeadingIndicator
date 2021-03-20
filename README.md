# 🧭 Heading Indicator

A µPackage for displaying a SwiftUI view that automatically rotates to always point towards a specified coordinate. It's like a compass, only
that it points wherever you like.

## Usage

You'll need an observed object that publishes location changes and current heading information, specifically you'll likely want to implement
the following in your `CLLocationManagerDelegate`:

* `func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])`
* `func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading)`

Then just create a new `HeadingIndicator` view, tell it where to point and set how it should display. Please make sure that the view
points up by default, otherwise it won't be rotated correctly.

```swift
import HeadingIndicator

HeadingIndicator(
    currentLocation: /* The device's current location. */,
    currentHeading: /* The device's current heading. */,
    targetLocation: /* The location to point to. */) {
        Image(systemName: "arrow.up.circle")
}
```
