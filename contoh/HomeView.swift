
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var services : Services
    
    var body: some View {
        VStack{
            Text(self.services.getFormattedDate())
            Text("Home View New")
            Button(
                action : {
                    self.services.isLoggedIn = false
                }
                
            ){
              Text("Logout")
            }
        }
        
    }
}
