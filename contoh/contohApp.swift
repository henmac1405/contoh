//
//  contohApp.swift
//  contoh
//
//  Created by user on 30/04/26.
//

import SwiftUI

@main
struct contohApp: App {
    @StateObject var controller = Controller()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(controller) 
        }
    }
}
