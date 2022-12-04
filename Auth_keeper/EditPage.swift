//
//  EditPage.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-29.
//

import SwiftUI

struct EditPage: View {
    let editData : PasswordData
    @State  var username: String = ""
    @State var description: String = ""
    @State  var email: String = ""
    @State  var password: String = ""
    @State  var docId: String = ""
    @ObservedObject var firebase = CRUD()
    @State var editSuccessfull: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter account description",text: $description).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding()
                TextField("Enter your email",text: $email).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding()
                TextField("Enter your UserName",text: $username).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding()
                TextField("Enter your password",text: $password).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding()
                
                Button{
                   
                   editSuccessfull = firebase.updateData(data: PasswordData(id: description, password: password, username: username, description: email, Others: email, docId: docId))
                }label: {
                    Text("Save")
                }
            }
            
            
        }.onAppear(){
            description = editData.description
            username = editData.username
            email = editData.id
            password = editData.password
            docId = editData.docId!
        }
        .navigationDestination(isPresented: $editSuccessfull){
            HomePage().navigationBarBackButtonHidden(true)
        }
    }
}

//struct EditPage_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPage(editId: String)
//    }
//}
