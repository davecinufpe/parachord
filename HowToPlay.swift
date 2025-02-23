//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct HowToPlay: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("How to play")
                    .font(.headline)
                    .monospaced()
                    .frame(width: 400, height: 50)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.black)
                
                
                Text("This is a music game where my parachute opens only when you choose the correct notes for the chord shown on my plane.  You gotta be fast because time FLIES!")
                
                    .font(.headline)
                    .monospaced()
                    .frame(width: 400, height: 200)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.black)
               
                
                Image("skydiverFace")
                    .resizable()
                    .frame( width: 150, height: 300)
                
                Button(action: {
                    path.append(Fluxo.StartGame)
                }) {
                    Text("PLAY")
                        .font(.system(.body, design: .monospaced))
                        .frame(width: 240, height: 60)
                        .background(Color("buttonColor"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .clipShape(Rectangle())
                        .shadow(color: .gray, radius: 2, x: -5, y: 5)
                    
                }
                
                
                Button(action: {
                    path.append(Fluxo.ChordsGuide)
                }) {
                    Text("Chords Guide")
                        
                        .font(.system(.body, design: .monospaced))
                        .frame(width: 240, height: 60)
                        .background(Color("buttonColor"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .clipShape(Rectangle())
                        .shadow(color: .gray, radius: 2, x: -5, y: 5)
                    
                }
                
            }
            
        }
    }
}

