//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/14/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // to preview nav elements in the preview
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
