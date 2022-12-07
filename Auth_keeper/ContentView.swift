//
//  ContentView.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-20.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    
    @ObservedObject var authentication = Authentication()
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("logo") .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 300, height: 200, alignment: .top).clipShape(Circle())
                
                Text("Log In").font(.largeTitle) .foregroundColor(.orange)
                
                TextField("UserName",text: $username).frame(width: 300, height: 30).accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .border(.secondary).padding(20)
                
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
                    authentication.login(email: username, password: password)
                    
                } label: {
                    Text("Login").font(.system(size: 20, weight: .semibold)).padding()
                }
               
                
                NavigationLink("Register", destination: SignUpPage()).font(.system(size: 20, weight: .semibold)).padding()
                
                
            }.navigationDestination(isPresented: $authentication.isUserAuthenticated){
                HomePage().navigationBarBackButtonHidden(true)
        }
       
        }
        
    }
}
            

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
