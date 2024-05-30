//
//  Docs.swift
//  docWall
//
//  Created by Roriana Vergara on 5/27/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLogged: Bool
    @Binding var password: String
    @Binding var alert: Bool

    let correctPassword = "roriver7"

    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            Circle()
                .scale(1.7)
                .foregroundColor(.white)
             .foregroundColor(.white)
            
            VStack {
                Text("Welcome to DocWallet")
                    .font(.title)
                    .bold()
                    .padding()
                
                SecureField("Enter Password", text: $password)
                    .padding()
                    .frame(width: 300,height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                
                Button(action: {
                    if password == correctPassword {
                        isLogged = true
                    } else {
                        alert = true
                    }
                }) {
                    Text("Login")
                        .frame(width: 200,height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .alert(isPresented: $alert) {
                    Alert(title: Text("Error"), message: Text("Incorrect Password"), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }
    }
}

struct Docs: Identifiable {
    let id = UUID().uuidString
    let image: String
}
    
var documents: [Docs] = [

    Docs( image: "passport"),
    Docs( image: "socialSecurity"),
    Docs( image: "driverLicense"),
    Docs( image: "workPermit"),
]
    




