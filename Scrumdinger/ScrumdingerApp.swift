//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/13/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
