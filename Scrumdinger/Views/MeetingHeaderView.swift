//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/15/22.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaning: Int
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaning
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaning: Int {
        secondsRemaning / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaning)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaning) minutes")
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaning: 180)
            .previewLayout(.sizeThatFits)
    }
}
