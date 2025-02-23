//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct HowToPlay: View {
    
    @Binding var path: NavigationPath
    
    let FINAL_TEXT: String = "Josh has developed an innovative parachute that opens to the sound of musical triads. \n \nEvery time he jumps, his device needs to detect 3 notes from a major chord to deploy the parachute. But he needs someone to play those notes for him. \n \nYou’re the lucky one! You’re Josh’s musical partner now! \n \nBut you gotta be fast, because time FLIES! \n \nHe needs to deploy his parachute within 5 jumps, with just 15 seconds for each one. \n \nIf you’ve landed here, we recommend checking out the Chords Guide before jumping into the game! \n \nBut if you feel ready, let’s get started!!"
    
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
                
                Spacer()
                
                Text(FINAL_TEXT)
                    .font(.custom(MyCustomFonts.secondFont.fontName, size: 18))
                    .foregroundColor(Color.black)
                    .frame(width: 600, height: 500)
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                Image("airplane")
                    .resizable()
                    .frame( width: 650, height: 300)
                    .padding(.bottom, 48)
                
                Spacer()
                
                HStack(spacing: 20){
                    Button(action: {
                        path.append(Fluxo.ChordsGuide)
                    }) {
                        Text("Chords Guide")
                        
                            .font(.custom(MyCustomFonts.secondFont.fontName, size: 18))
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
                            .font(.custom(MyCustomFonts.secondFont.fontName, size: 18))
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


