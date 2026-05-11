import SwiftUI

struct TerminalView: View {
    @EnvironmentObject var controller : Controller
    @State var terminalid = "2181873382"
    @State var branchid = "1711121"
    @State var saletypeid = "ticket"
    @State var machineid = "ticket"
    @State var terminalname : String = ""
    
    var body: some View {
        VStack {
            Text("Terminal Name : \(terminalname)")
            HStack {
                Spacer()
                Button(action:{
                    self.controller.getTerminal(terminalid: terminalid, branchid: branchid, salestypeid: saletypeid, machineid: machineid) { json in
                        DispatchQueue.main.async {
                            if let data = json {
                                print("state : \(data["state"])")
                                if data["state"] == true {
                                    if (data["data"].count > 0 ){
                                        for i in 0..<data["data"].count {
                                            print(i)
                                            print(data["data"][i]["terminal_name"])
                                            self.terminalname = "\(data["data"][i]["terminal_name"])"
                                        }
                                    }
                                } else{
                                    self.controller.showAlert = true
                                    self.controller.responseMessage = "Gagal Load Data Terminal"
                                }
                            } else {
                                self.controller.showAlert = true
                                self.controller.responseMessage = "Gagal Load Data Terminal"
                                
                            }
                        }
                    }
                }){
                    Text("Get Terminal").bold().font(.callout).foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(Color.purple)
            .cornerRadius(15)
        }.padding()
    }
}
