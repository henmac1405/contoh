 
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var controller : Controller
    @State private var username : String = "suhendra"
    @State private var password : String = "rahasia"
    @State var isEmptyField = false
    let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0 )
    //tes GITHUB
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image("gembok3")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                Spacer()
            }
            
            Text("User Name")
            TextField("username", text : $username)
                .padding()
                .cornerRadius(5)
                .background(lightGrayColor)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            Text("Password")
            SecureField("password", text : $password)
                .padding()
                .cornerRadius(5)
                .background(lightGrayColor)
                .autocapitalization(.none)
             
            // Login Button
            HStack{
                Spacer()
                Button(action:{
                    if (self.username.isEmpty || self.password.isEmpty ) {
                        self.controller.showAlert = true
                        self.controller.messageAlert = "Username dan password tidak boleh kosong"
                    } else {
                        self.controller.username = self.username
                        self.controller.user_password = self.password
                        self.controller.getCompany()
                    }
                }){
                    Text("Login").bold().font(.callout).foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
            
             
            
             
            Spacer()
            
        }.padding(30)
    }
}
