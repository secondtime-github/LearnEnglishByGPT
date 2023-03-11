//
//  Model.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import Foundation

struct Word: Identifiable {
    let id = UUID()
    var englishWord: String
    var chineseWord: String
}

// MARK: - GPT Model

struct GPTRequstBody: Codable {
    let model: String
    let messages: [Message]
}

struct Message: Codable {
    let role: String
    let content: String
}

struct GPTResponseBody: Codable {
    var choices: [Choice]
}

struct Choice: Codable {
    var message: Message
}
