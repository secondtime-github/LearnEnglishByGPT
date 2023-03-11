//
//  LearnEnglishByChatGPTApp.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import SwiftUI

@main
struct LearnEnglishByChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(ViewModel())
        }
    }
}
