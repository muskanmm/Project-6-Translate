//
//  TranslateHistoryView.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI

struct TranslateHistoryView: View {
    @StateObject private var translateManager: TranslationManager
    @State private var translations: [Translation] = []
    
    init(translateManager: TranslationManager) {
        self._translateManager = StateObject(wrappedValue: translateManager)
    }
    var body: some View {
        ScrollView{
            Spacer()
            VStack {
                ForEach(translations) { translation in
                    Text(translation.translatedText)
                        .frame(width: 300, height: 40)
                        .background(.mint)
                }
                Spacer()
                Button(action: {
                    deleteTranslations()
                }, label: {
                    Text("Clear Translation History")
                        .background(.red)
                        .foregroundColor(.white)
                        .frame(width:300, height: 100)
                })
            }
            .onAppear {
                fetchTranslations()
            }
        }
        .navigationTitle("Translations")
    }
    
    func fetchTranslations() {
//        translateManager.fetchTranslations { translations in
//            self.translations = translations
//        }
        translateManager.fetchTranslations()
        self.translations = translateManager.translations
        print("history: \(translateManager.translations)")
        print(translations)
    }
    
    func deleteTranslations() {
//        ForEach(translations) { translation in
//            let _ = print("Loop::\(translation)")
//
//        }
        print("first elem: \(translations.first)")
        translateManager.deleteTranslations()
        translateManager.translations = []
        self.translations = []
    }
}

#Preview {
    TranslateHistoryView(translateManager: TranslationManager())
}
