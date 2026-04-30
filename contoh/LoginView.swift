 
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var services : Services
    @State private var username : String = ""
    @State private var password : String = ""
    @State var isEmptyField = false
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            Image("gembok3")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            Text("User Name")
            TextField("username", text : $username)
                .padding()
                .cornerRadius(5)
                .background(.white)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            Text("Password")
            SecureField("password", text : $password)
                .padding()
                .cornerRadius(5)
                .background(.white)
                .autocapitalization(.none)
            
            // salah password
            if(!self.services.isCorrect){
                Text("Username dan password salah").foregroundColor(.red)
            } else {
                Text("").foregroundColor(.white)
            }
            
            // field kosong
            if (self.isEmptyField == true) {
                Text("Username dan password tidak boleh kosong").foregroundColor(.red)
            }
             
            
            // Sign in Button
            HStack{
                Spacer()
                Button(action:{
                    if (self.username.isEmpty || self.password.isEmpty ) {
//                        isEmptyField = true
                        self.services.showAlert = true
                        self.services.messageAlert = "Username dan password tidak boleh kosong HENDRA"
                    } else {
                        self.services.isLoggedIn = true
                        self.services.isLoading = true
                         
//                        self.userAuth.cekLogin(user_id: self.username, user_pin: self.password)
                    }
                }){
                    Text("Login").bold().font(.callout).foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
            
             
            
            
        }.padding(30)
    }
}
