//
//  TranslationResponse.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI

struct TranslationResponse: Codable {
    let responseData: Translation
}

struct Translation: Codable { //}, Hashable, Equatable {
//    let id: Int
//    let segment: String
    let translatedText: String
//    let source: String
//    let target: String
}
