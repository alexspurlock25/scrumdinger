//
//  DetailedEditView.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/14/22.
//

import SwiftUI

struct DetailedEditView: View {
    @State private var data = DailyScrum.Data()
    
    var body: some View {
        Form {
            Section(content: {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }, header: { Text("Meeting Info")})
        }
    }
}

struct DetailedEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEditView()
    }
}
