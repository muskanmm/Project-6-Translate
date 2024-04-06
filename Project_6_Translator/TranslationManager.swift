//
//  TranslationManager.swift
//  Project_6_Translator
//
//  Created by Muskan Mankikar on 4/6/24.
//

//import Firebase
import Foundation
import FirebaseFirestore  /*<-- Import Firestore framework*/
import FirebaseFirestoreSwift // <-- Import additional FirebaseSwift framework


//class TranslationManager: ObservableObject {
//    @Published var translations: [Translation] = []
//    private let database = Firestore.firestore()
//    
//    func saveTranslation(translatedText: String) {
//        let translation = Translation(id: UUID().uuidString, translatedText: translatedText)
//        do {
//            try database.collection("translations").document(translation.id).setData(from: translation)
//        } catch {
//            print("Error saving translation to Firestore: \(error)")
//        }
//    }
//    
//    func fetchTranslations(completion: @escaping ([Translation]) -> Void) {
//        database.collection("translations").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching translations: \(error)")
//                completion([])
//                return
//            }
//            
//            let translations = querySnapshot?.documents.compactMap { document in
//                try? document.data(as: Translation.self)
//            }
//            
//            DispatchQueue.main.async {
//                self.translations = translations ?? []
//                completion(self.translations)
//            }
//        }
//    }
//}

@Observable
class TranslationManager: ObservableObject {
    
    var translations: [Translation] = []
    
//    let database = Firestore.firestore()
    private let dataBase = Firestore.firestore()
    
    func fetchTranslations() {
        // Access the "Messages" collection group in Firestore and listen for any changes
        dataBase.collectionGroup("translations").addSnapshotListener { querySnapshot, error in

            // Get the documents for the messages collection (a document represents a message in this case)
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Map Firestore documents to Message objects
            let translation = documents.compactMap { document in
                do {
                    // Decode message document to your Message data model
                    return try document.data(as: Translation.self)
                } catch {
                    print("Error decoding document into message: \(error)")
                    return nil
                }
            }
            
            // Update the messages property with the fetched messages (sorting ascending timestamp)
            print("translations: \(translation)")
            self.translations = translation
            print("self.translations: \(translation)")
        }
    }
    
    func saveTranslation(translation: String) {
        do {
            // Create a message object
            let translation = Translation(id: UUID().uuidString, translatedText: translation)

            // Save the message to your Firestore database
            try dataBase.collection("translations").document().setData(from: translation)
            

        } catch {
            print("Error sending message to Firestore: \(error)")
        }
    }
    
    func deleteTranslations() {
        dataBase.collection("translations").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    document.reference.delete { err in
                        if let err = err {
                            print("Error removing document: \(err)")
                        } else {
                            print("Document successfully removed!")
                        }
                    }
                }
            }
        }
    }
    
//    func deleteTranslations(docId: String) {
//        let docRef = dataBase.collection("translations").document()
//        
//        docRef.delete { error in
//            if let error = error {
//                print("Error deleting document: \(error)")
//            } else {
//                print("Document successfully deleted!")
//            }
//        }
//    }
    
}
