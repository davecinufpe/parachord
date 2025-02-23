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
                    .font(.custom(MyCustomFonts.textFont.fontName, size: 24))
                   
                    .frame(width: 400, height: 50)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .padding(.trailing, 520)
                
                Spacer()
                
                Text("Josh has developed an innovative parachute that opens to the sound of musical triads. \n \nEvery time he jumps, his device needs to detect 3 notes from a chord to deploy the parachute. But Josh can’t do that that when he is the air ... he needs someone needs to play those notes for him. \n \nYou’re the lucky one! You’re Josh’s musical partner now! \n \nBut you gotta be fast, because time flies! \n \nHe needs to deploy his parachute within 5 jumps, with just 15 seconds for each one. \n \nIf you’ve landed here, we recommend checking out the Chord Guide before jumping into the game!. \n \nIf you’re ready, let’s get started!!")
                
                    .font(.headline)
                    .monospaced()
                    .frame(width: 600, height: 400)
                    .cornerRadius(8)
                    .foregroundColor(.black)
               
                
//                Image("skydiverFace")
//                    .resizable()
//                    .frame( width: 150, height: 300)
                
                Spacer()
               
                HStack {
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
               
                Button(action: {
                    path.append(Fluxo.StartGame)
                }) {
                    Text("Start")
                        .font(.system(.body, design: .monospaced))
                        .frame(width: 240, height: 60)
                        .background(Color("buttonColor"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .clipShape(Rectangle())
                        .shadow(color: .gray, radius: 2, x: -5, y: 5)
                    
                }
                }
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
               
        }
    }
}

