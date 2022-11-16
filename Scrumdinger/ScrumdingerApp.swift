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
                    ScrumStore.save(scrums: store.scrums) { result in
                        if case .failure(let failure) = result {
                            fatalError(failure.localizedDescription)
                        }
                    }
                })
            }
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
