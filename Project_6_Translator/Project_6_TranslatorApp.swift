//
//  Project_6_TranslatorApp.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI
import FirebaseCore

@main
struct Project_6_TranslatorApp: App {
    
    init() { // <-- Add an init
        FirebaseApp.configure() // <-- Configure Firebase app
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
