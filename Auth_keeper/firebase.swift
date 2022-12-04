//
//  firebase.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift


class CRUD : ObservableObject{
    
    private var db: Firestore!
    private  var MyCollection = "passwords"
    let auth = Auth.auth()
   
    
    
    init() {
        db = Firestore.firestore()
    }
    
    
    func addData(data : PasswordData) ->Bool {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        print("came")
        
            ref = db.collection(MyCollection).addDocument(data: [
                "Email" : auth.currentUser?.email! ?? "",
                "email" : data.id,
                "password" : data.password,
                "username" : data.username,
                "description" : data.description,
                "others" : data.id
            ]){err in
                if let err = err{
                    print("Document adding error \(err)")
                }
                print("Document added with ID: \(ref!.documentID)")
                self.db.collection(self.MyCollection).document(ref!.documentID).updateData([
                    "docId" : ref?.documentID ?? ""
                ]
                    
                )
            }
            return true
        }
    
    
    func getAllData(completion: @escaping (_ listData: [[String: Any]]?) -> Void){
         var listData = [[String : Any]]()
         var listId = [String]()
        @State var dataArray : [PasswordData] = []
        Firestore.firestore().collection(MyCollection).whereField("Email", isEqualTo: auth.currentUser?.email! ?? "").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                   listData.append(document.data())
                 //   listData[((document.documentID) as NSString).integerValue] = document.data()
                     listId.append(document.documentID)
                }
                print(listData)
                print(listId)
                completion(listData)
            }
        }
     
      
    }
    
    
    
    func updateData(data : PasswordData) -> Bool{
        
        db.collection(MyCollection).document(data.docId!).updateData([
            "Email" : auth.currentUser?.email! ?? "",
            "email" : data.id,
            "password" : data.password,
            "username" : data.username,
            "description" : data.description,
            "others" : data.id,
            "docId" : data.docId!
        ]){err in
            if let err = err{
                print("Document adding error \(err)")
               
            }
            print("data updated")
          
        }
        return true
    }
    
    
    func deleteDocument(data : PasswordData) {
        db.collection(MyCollection).document(data.docId!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
       
    }
    
             
        }

struct PasswordData : Codable,Hashable,Identifiable {
    
    var id: String
    var password : String
    var username : String
    var description : String
    var Others : String
    var docId  : String?
}
    




