//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/16/22.
//

import Foundation
import SwiftUI

// view model?
// contains objectWillChange that tells to listeners when @Published is about to change
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
}
