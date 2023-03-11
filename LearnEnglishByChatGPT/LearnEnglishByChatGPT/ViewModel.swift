//
//  ViewModel.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var wordList: [Word] = []
    @Published var article: String = ""
    
    var formatWordList: String {
        var str: String = ""
        for word in self.wordList {
            str += "\(word.englishWord)\n"
        }
        return str
    }
    
    init() {
        createWordLists()
    }
    
    func createWordLists() {
        self.wordList = Array(ieltsWords.shuffled()[..<7])
    }
    
    func writeArticle() {
        fetchChatGPTAPI(using: formatWordList) { message in
            DispatchQueue.main.async {
                self.article = message
            }
        }
    }
}

