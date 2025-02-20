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
                    .frame(width: 400, height: 50)
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
                        .padding()
                        .frame(width: 400, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                
                Button(action: {
                    path.append(Fluxo.ChordsGuide)
                }) {
                    Text("Chords Guide")
                        
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(width: 400, height: 50)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                }
                
            }
            
        }
    }
}

