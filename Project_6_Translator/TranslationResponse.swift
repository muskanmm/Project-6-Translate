//
//  TranslationResponse.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI

struct TranslationResponse: Codable {
    let responseData: TranslationData
}

struct TranslationData: Codable {
    let translatedText: String
}

struct Translation: Codable, Identifiable { //}, Hashable, Equatable {
    let id: String
//    let segment: String
    let translatedText: String
//    let source: String
//    let target: String
}
