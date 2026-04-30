import Foundation
import SwiftUICore
import UIKit
import SwiftyJSON

class Services : ObservableObject{
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var isCorrect = true
    @Published var url_api = "https://apidev.transstudiomini.com/index.php/apiv5/"
    
    @Published var showAlert = false
    @Published var messageAlert = ""
    
    //Model
    @Published var dataUser : [DataUser] = []
    
    // Function ==================================================================================
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        
         
        formatter.locale = Locale(identifier: "id_ID")
        
         
        formatter.dateFormat = "EEEE, dd MMMM yyyy HH:mm:ss zzz"
        
        return formatter.string(from: Date())
    }
    
    //API ===========================================================================================
    
}
