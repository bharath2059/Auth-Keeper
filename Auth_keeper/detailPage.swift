//
//  detailPage.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-29.
//

import SwiftUI

struct detailPage: View {
    
    let detailsData : PasswordData
    @State var edit : String = ""
    @ObservedObject var firebase = CRUD()
    @State private var isdeleted : Bool = false
    @State  var isDeleteSuccessful :Bool = false
    
    func delete(){
        firebase.deleteDocument(data: detailsData)
        isDeleteSuccessful = true
    }
  
    var body: some View {
        NavigationView(){
            VStack{
                VStack{
                    Text("Description = \(detailsData.id)").fontWeight(.medium).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 6))
                    Text("Email = \(detailsData.description)").fontWeight(.medium).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 6))
                    Text("User Name = \(detailsData.username)").fontWeight(.medium).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 6))
                    Text("Password = \(detailsData.password)").fontWeight(.medium).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 6))
                    Text("Others = \(detailsData.id)").fontWeight(.medium).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 6))
                    Spacer()
                }.backgroundStyle(.green)
                
                
                
                VStack(alignment: .trailing, spacing: 16){
                    NavigationLink(destination: EditPage(editData: detailsData)){
                        Text("Edit")
                    }.font(.system(size: 20)).foregroundColor(.blue).padding(EdgeInsets(top: 10, leading: 0, bottom: 10,  trailing: 0 ))
                    Button{
                       isdeleted = true
                    }label: {
                        Text("Delete")
                    }.font(.system(size: 20)).foregroundColor(.red).padding(EdgeInsets(top: 10, leading: 0, bottom: 10,  trailing: 0 ))
                        .alert("Delete Password?", isPresented: $isdeleted) {
                            Button("Delete", role: .destructive, action: delete)
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("Are you sure?")
                        }
                }
            }
        }.navigationTitle(detailsData.id)
            .onAppear(){
                print(detailsData)
            }
            .navigationDestination(isPresented : $isDeleteSuccessful){
                HomePage().navigationBarBackButtonHidden()
            }
           
    }
}

//struct detailPage_Previews: PreviewProvider {
//    static var previews: some View {
//        detailPage(detailsData: PasswordData)
//    }
//}
