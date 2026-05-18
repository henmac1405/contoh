
import Foundation
import SwiftUI

struct UserView: View {
    @EnvironmentObject var controller : Controller
    //
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(self.controller.dataUserIbos, id: \.username) { item in
                        
                        NavigationLink(destination: Text("Detail Page")){
                            
                            HStack{
                                Text("\(item.username)").padding(.leading, 10)
                                Text("\(item.user_fullname)").padding(.leading, 10)
                            }
                        }
                         
                    }
                    
                }
                .padding()
                .navigationTitle("Data User") // Judul muncul di posisi yang benar
                .navigationBarTitleDisplayMode(.inline) // Gaya judul kecil di tengah (lebih rapi)
            }
        }
        
    }
}

