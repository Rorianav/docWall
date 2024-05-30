//
//  ContentView.swift
//  docWall
//
//  Created by Roriana Vergara on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    
        @State private var isLogged = false
        @State private var password = ""
        @State private var alert = false
    
    var body: some View {
        
        if isLogged {
            Home()
        } else {
            LoginView(isLogged : $isLogged, password: $password, alert: $alert)
        }
    }
}

#Preview {
    ContentView()
}
