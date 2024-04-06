//
//  TranslateHistoryView.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

import SwiftUI

struct TranslateHistoryView: View {
    var body: some View {
        ScrollView{
            Form {
                Section(header: Text("Past words")) {
                    HStack{
                        Text("Hello")
                    }
                }
            }
        }
    }
}

#Preview {
    TranslateHistoryView()
}
