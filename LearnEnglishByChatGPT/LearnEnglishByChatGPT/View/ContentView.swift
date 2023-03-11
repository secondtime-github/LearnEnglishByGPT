//
//  ContentView.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            
            List {
                ForEach(vm.wordList) { word in
                    HStack {
                        Text(word.englishWord)
                        Spacer()
                        Text(word.chineseWord)
                    }
                }
            }
            
            NavigationLink(destination: ArticleView()) {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Write an essay with these 7 words")
            }
            
        }
        .navigationTitle("Word List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    vm.createWordLists()
                }) {
                    Image(systemName: "arrow.clockwise")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
