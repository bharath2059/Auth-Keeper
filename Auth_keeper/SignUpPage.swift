//
//  SignUpPage.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-21.
//

import SwiftUI

struct SignUpPage: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @State  var ispresented = false
    @ObservedObject var authentication = Authentication()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Auth-Keeper").font(.largeTitle)
                Text("SignUp").font(.system(size: 30, weight: .medium)).padding(20)
                
                TextField("Name",text: $username).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6)) .cornerRadius(5)
                
                TextField("UserName",text: $email).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding(10)
                
                HStack {
                    ZStack(alignment: .trailing) {
                        TextField("Password", text: $password)
                        
                            .focused($focus1)
                            .opacity(showPassword ? 1 : 0)
                        SecureField("Password", text: $password)
                        
                            .focused($focus2)
                            .opacity(showPassword ? 0 : 1)
                        Button(action: {
                            showPassword.toggle()
                            if showPassword { focus1 = true } else { focus2 = true }
                        }, label: {
                            Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill").font(.system(size: 16, weight: .regular))
                                .padding()
                        })
                    }
                    .frame(width: 300, height: 30)
                    .border(.secondary).padding()
                }
                
                Button {
                    authentication.register(email: email, password: password)
                    
                } label: {
                    Text("Register").font(.system(size: 20)).padding(20)
                }.padding(20)
            }
            
            .navigationDestination(isPresented: $authentication.isAccountCreated){
                ContentView().navigationBarBackButtonHidden(true)
                   
            } 
        }
    }
}


struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
