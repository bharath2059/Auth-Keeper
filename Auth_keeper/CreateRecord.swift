//
//  CreateRecord.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift

struct CreateRecord: View {
    
    @State  var username: String = ""
    @State var description: String = ""
    @State  var email: String = ""
    @State  var password: String = ""
  //  @State var addData : PasswordData
    @State var success : Bool = false
    @State var documentAdded : Bool = false
    @State var showingView : Bool = false
    let db = Firestore.firestore()
  //  private  var MyCollection = "passwords"
   
    
    @ObservedObject var firebase = CRUD()
    
    func addData(){
        let addData: PasswordData = PasswordData(id: self.email, password: self.password, username: self.username, description: self.description, Others: self.email)
        documentAdded = firebase.addData(data : addData)
    }
    
    var body: some View {
        NavigationStack{
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
                   success = true
                }label: {
                    Text("add password")
                }
                
                .alert("Congratulations", isPresented: $success) {
                    Button("OK", role: .none, action: addData)
                    
                } message: {
                    Text("Your password has been added")
                }
                
            }
    
            .navigationDestination(isPresented:$documentAdded){
                HomePage().navigationBarBackButtonHidden(true)
        }
                                               
                                            }

    }
}




//struct CreateRecord_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRecord(addData: <#PasswordData#>)
//    }
//}
