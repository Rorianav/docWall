//
//  Home.swift
//  docWall
//
//  Created by Roriana Vergara on 5/27/24.
//

import SwiftUI

struct Home: View {
    //animation and background mode
    @State var expandCards: Bool = false
    @State private var darkModeEnabled : Bool = false
    @Environment (\.colorScheme) var colorBackground
    
    var body: some View {
       
            //Title
            VStack{
                HStack {
                    Text("DocWallet")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                       
          //Dark mode
            Toggle("",isOn: $darkModeEnabled)
                    .preferredColorScheme(darkModeEnabled ?
         
                        .dark : .light)
       // Close documents
                    Button {
             
             withAnimation(.interactiveSpring(response: 0.8,
                            dampingFraction: 0.7,
                            blendDuration: 0.7)) {
                 expandCards = false
             }
             
         } 
                label: {
             
               Image(systemName: "plus")
                       .foregroundColor(.white)
                       .padding(10)
                       .background(.blue, in: Circle())
            } //label
              .rotationEffect(.init(degrees: expandCards ? 45 : 0))
              .offset(x: expandCards ? 10:15)
              .opacity(expandCards ? 1:0)
              
                
            } //HStack
                   
                
            ScrollView(.vertical, showsIndicators:false) {
                    VStack (spacing : 0){
                        
                        //documents
                        ForEach(documents){doc in
                            docView(doc: doc)
                        } //forEach
                    } //VStack SV
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(expandCards ? 0 : 0.01))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    expandCards = true
                                }
                            }
                    } // overlay
                } //ScrollView
                .coordinateSpace(name:"scroll")
            } //VStack
            .padding([.horizontal,.top])
        } //body
    
    
    @ViewBuilder
    func docView(doc: Docs)-> some View {
        GeometryReader {
            proxy in
            
            let rect = proxy.frame(in: .named ("scroll"))
            let offset = -rect.minY + CGFloat(getIndex(Docs:doc) * 70)
            
            
            ZStack (alignment: .bottomLeading) {
                
                Image(doc.image)
                    .resizable()
                    .padding(5)
                    .cornerRadius(30)
                    .offset(y:expandCards ? 0 : offset)
              
            } //ZStack
            
        } .frame(height: 200)
    }
    
    func getIndex(Docs: Docs)-> Int {
        return documents.firstIndex {
            currentCard in return currentCard.id == Docs.id
        } ?? 0
        
    }
} //view

#Preview {
    Home()
}
