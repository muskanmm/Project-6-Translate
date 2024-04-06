//
//  ContentView.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var translations: [Translation] = []
    @State private var inputWord: String = ""
    @State private var translateWord: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter word here", text: $inputWord)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    translateText(inputWord: inputWord)
                }, label: {
                    Text("Translate")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                })
                ZStack {
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 2) // Fill color of the rectangle
                        .frame(width: 200, height: 100) // Width and height of the rectangle
                        .cornerRadius(10) // Corner radius of the rectangle
                    Text(translateWord)
                        .foregroundColor(.black) // Text color
                        .padding() // Add padding around the text
                }.padding()
                
                NavigationLink(destination: TranslateHistoryView()) {
                    Text("View translate history")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .border(Color.black)
                }
                .padding()
                
            }
            .padding()
            .navigationTitle("Translate Me")
        }
        .navigationTitle("Translate")
    }
    
    func translateText(inputWord: String) {
        let urlString = "https://api.mymemory.translated.net/get?q=\(inputWord)&langpair=en|es"
        guard let url = URL(string: urlString) else {
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let translationResponse = try JSONDecoder().decode(TranslationResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.translateWord = translationResponse.responseData.translatedText
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
