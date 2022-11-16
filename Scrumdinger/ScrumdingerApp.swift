//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/13/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums, saveAction: {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            fatalError("Error saving scrums.")
                        }
                    }
                })
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
