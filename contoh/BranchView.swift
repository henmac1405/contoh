
import Foundation
import SwiftUI

struct BranchView: View {
    @EnvironmentObject var controller : Controller
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(self.controller.dataBranch, id: \.branch_id) { item in
                        
                        NavigationLink(destination: BranchDetilView(branch: item)){
                            
                            HStack{
                                Text("\(item.branch_id)").padding(.leading, 10)
                                Text("\(item.branch_name)").padding(.leading, 10)
                            }
                        }
                         
                    }
                    
                }
                .padding()
                .navigationTitle("Data Branch") // Judul muncul di posisi yang benar
                .navigationBarTitleDisplayMode(.inline) // Gaya judul kecil di tengah (lebih rapi)
            }
        }
        
    }
}

