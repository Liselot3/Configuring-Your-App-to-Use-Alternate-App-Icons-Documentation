/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The entry point for the AlternateAppIcon app.
*/

import SwiftUI

@main
struct AlternateAppIcon: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
        }
    }
}
