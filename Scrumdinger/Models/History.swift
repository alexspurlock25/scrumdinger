//
//  History.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/16/22.
//

import Foundation

struct History: Identifiable, Codable {
    var id: UUID
    var date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int
    var transcript: String?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], lengthInMinutes: Int = 5, transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript = transcript
    }
}
