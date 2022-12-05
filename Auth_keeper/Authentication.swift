//
//  Authentication.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-23.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth
import SwiftUI



class Authentication :ObservableObject{
    
    @Published  var isAccountCreated =  false
    @Published var isUserAuthenticated = false
    @Published var isUserSignedIn = false
    @Published var isUser : Bool = false
 
    
    func register(email : String, password : String){
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard authResult != nil, error == nil else{

                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.isAccountCreated=true
                print(self.isAccountCreated)
            }
        }
    }
    
    
    func login(email: String, password : String){
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
           
            guard  authResult != nil, error == nil else{
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self?.isUserAuthenticated=true
                print(self?.isUserAuthenticated as Any)
            }
        }
        
    }
    
    func userSignedIn(){
         if Auth.auth().currentUser != nil {
           isUser = true
         } else {
           // No user is signed in.
           // ...
             isUser = false
             
         }
     }
    
   
}
