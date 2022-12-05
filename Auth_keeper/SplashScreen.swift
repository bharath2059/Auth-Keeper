//
//  SplashScreen.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-12-04.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive : Bool = false;
    @ObservedObject var auth = Authentication()
    var body: some View {
        
        if isActive {
            if auth.isUser{
                HomePage()
            }
            else{
                ContentView()
            }
        }else{
            VStack{
                Text("Auth-Keeper").font(.system(size: 50,weight: .bold)).foregroundColor(.green)
            }
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    // 7.
                    withAnimation {
                        self.isActive = true
                    }
                }
                DispatchQueue.main.async {
                    auth.userSignedIn()
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
