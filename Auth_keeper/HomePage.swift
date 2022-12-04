//
//  HomePage.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-23.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var firebase = CRUD()
    @State var dataArray : [PasswordData] = []
    var body: some View {
        NavigationView(){
            VStack{
                List($dataArray){ array in
                    NavigationLink(destination: detailPage(detailsData: array.wrappedValue)){
                        Text(array.id)
                    }
                }
                
                NavigationLink("add password", destination: CreateRecord())
            }
        
        }.onAppear(){
            self.dataArray = []
            firebase.getAllData{ Data in
                if let data : [[String : Any]] = Data {
                    for document in data {
                        self.dataArray.append(PasswordData(id: document["description"] as! String, password: document["password"] as! String, username: document["username"] as! String, description: document["email"] as! String, Others: document["email"] as! String, docId: document["docId"] as? String))
                    }
                    print(self.dataArray)
                }
            }
            
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
