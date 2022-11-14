//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/13/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
