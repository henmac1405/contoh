import SwiftUI

struct LoginView: View {
    @EnvironmentObject var controller : Controller
    @State private var username = "suhendra"
    @State private var password = "rahasia"
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.white.ignoresSafeArea()
                
                
                VStack(spacing: 20) {
                    Image("TE")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.top, 40)
                    
                    
                    VStack(spacing: 15) {
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            
                            Button(action: { isPasswordVisible.toggle() }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                    .padding(.horizontal, 30)
                    
                    VStack(spacing: 15) {
                        Button(action: {
                            if (self.username.isEmpty || self.password.isEmpty ) {
                                self.controller.showAlert = true
                                self.controller.messageAlert = "Username dan password tidak boleh kosong"
                            } else {
                                self.controller.username = self.username
                                self.controller.user_password = self.password
                                self.controller.getCompany()
                            }
                        }) {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0, green: 0.6, blue: 0.8))
                                .cornerRadius(35)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    
                    
                    
                    Spacer()
                }
                
                
            }
            
        }
        
    }
    
    
    
    // Helper untuk TextField
    func customTextField(placeholder: String, text: Binding<String>, isSecure: Bool = false) -> some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: text)
            } else {
                TextField(placeholder, text: text)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 1))
    }
    
    
}

#Preview {
    LoginView()
}
