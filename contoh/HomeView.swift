
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var controller : Controller
    @StateObject var locationManager = LocationManager()
    @State private var showCalendar = false
    @State private var showDate = Date()
    //update by Hendra 18052026
    var body: some View {
        NavigationView {
            
            
            VStack{
                AsyncImage(url: URL(string: self.controller.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                
                Text(self.controller.getFormattedDate()).padding()
                Text("Selamat Datang, \(self.controller.user_name)").padding()
                
                // Branch Button
                NavigationLink(destination: BranchView()) {
                    HStack {
                        Spacer()
                        Text("Branch")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    self.controller.getBranch()
                })
                
                // Terminal Button
                NavigationLink(destination: TerminalView()) {
                    HStack {
                        Spacer()
                        Text("Terminal")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
                }
                
                
                // Camera Button
                NavigationLink(destination: CameraView()) {
                    HStack {
                        Spacer()
                        Text("Camera")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(15)
                }
                
                
                // Location Button
                NavigationLink(destination: LocationView()) {
                    HStack {
                        Spacer()
                        Text("Location")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                }
                // Calender Button
                Button(action:{
                    showCalendar = true
                }){
                    HStack {
                        Spacer()
                        Text("Calender")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                }
                .sheet(isPresented: $showCalendar) {
                    VStack {
                        DatePicker("Pilih Tanggal", selection: $showDate, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .padding()
                        Button("Selesai") { showCalendar = false }
                            .padding()
                    }
                    .presentationDetents([.medium])
                }
                
                // Logout Button
                HStack{
                    Spacer()
                    Button(action:{
                        self.controller.isLoggedIn = false
                    }){
                        Text("Logout").bold().font(.callout).foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.red)
                .cornerRadius(15)
                
                
            }
            .padding()
            .navigationTitle("Home")
            
        }
    }
}
