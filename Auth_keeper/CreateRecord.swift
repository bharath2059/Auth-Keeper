//
//  CreateRecord.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-23.
//

import SwiftUI

struct CreateRecord: View {
    
    @State private var username: String = ""
    @State private var description: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter account description",text: $description).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .border(.secondary).padding()
            TextField("Enter your email",text: $email).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .border(.secondary).padding()
            TextField("Enter your UserName",text: $username).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .border(.secondary).padding()
            TextField("Enter your password",text: $password).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .border(.secondary).padding()
            Button("Add account"){
                
            }
        }
    }
}

struct CreateRecord_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecord()
    }
}
