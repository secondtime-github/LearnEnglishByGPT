//
//  ArticleView.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import SwiftUI

struct ArticleView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            
            if vm.article == "" {
                ProgressView()
            } else {
                HStack {
                    Text("Created by chatGPT")
                        .fontWeight(.heavy)
                    Spacer()
                }
                Text(vm.article)
                    .padding()
            }
            
        }
        .padding()
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            vm.writeArticle()
            //vm.article = testText
        }
        .onDisappear {
            vm.article = ""
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
            .environmentObject(ViewModel())
    }
}
