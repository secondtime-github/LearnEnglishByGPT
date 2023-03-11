//
//  WelcomeView.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ContentView()) {
                Image(systemName: "note.text.badge.plus")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Create 7 words")
            }
            .navigationTitle("Learn English Words")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(ViewModel())
    }
}
