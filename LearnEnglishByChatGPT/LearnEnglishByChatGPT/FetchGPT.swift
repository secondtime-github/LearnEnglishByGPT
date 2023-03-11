//
//  FetchGPT.swift
//  LearnEnglishByChatGPT
//
//  Created by TEKI HOU on 2023-03-11.
//

import Foundation

func fetchChatGPTAPI(using wordList: String, completion: @escaping (String) -> Void) {
    let apiKey = API_KEY
    
    let question: String = "请用以下单词写一段50词左右的文章：\n\(wordList)"
    //print(question)
    
    // ChatGPT API endpoint URL
    let urlString = "https://api.openai.com/v1/chat/completions"
    guard let url = URL(string: urlString) else { return }
    
    // Create a URLRequest object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Create a JSON request body
    let requestBody: GPTRequstBody = GPTRequstBody(
        model: "gpt-3.5-turbo",
        messages: [Message(role: "user", content: question)]
    )
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted // 设置输出格式
    let jsonData = try? encoder.encode(requestBody)
    guard let jsonData = jsonData else {
        print("JSON 编码错误")
        return
    }
    //print(String(data: jsonData, encoding: .utf8)!)
    
    // Set the HTTP request body
    request.httpBody = jsonData
    
    // Send the HTTP request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error fetching data: \(error.localizedDescription)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Invalid response")
            return
        }
        
        guard let data = data else {
            print("No data received")
            return
        }
        
        do {
            let responseData = try JSONDecoder().decode(GPTResponseBody.self, from: data)
            let content = responseData.choices[0].message.content
            print("choices[0] 的 message 的 content 是: \(content)")
            completion(content)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
    
    task.resume()
    
}

