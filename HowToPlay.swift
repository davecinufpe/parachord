//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct HowToPlay: View {
    
    @Binding var path: NavigationPath
  
    
    @State var text: String = ""
    @State var isAnimating: Bool = false
    
    let finalText: String = "Josh has developed an innovative parachute that opens to the sound of musical triads. \n \nEvery time he jumps, his device needs to detect 3 notes from a major chord to deploy the parachute. But he needs someone to play those notes for him. \n \nYou’re the lucky one! You’re Josh’s musical partner now! \n \nBut you gotta be fast, because time FLIES! \n \nHe needs to deploy his parachute within 5 jumps, with just 15 seconds for each one. \n \nIf you’ve landed here, we recommend checking out the Chord Guide before jumping into the game! \n \nIf you’re ready, let’s get started!!"
    
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
                
                Text(text)
                
                    .font(.custom(MyCustomFonts.secondFont.fontName, size: 18))
                    .foregroundColor(Color.black)
                    .frame(width: 600, height: 400)
                    .cornerRadius(8)
                    .onAppear(){
                        
                        typeWriter()
                        isAnimating = true
                }
                    
               
                
                Image("airplane")
                    .resizable()
                    .frame( width: 650, height: 300)
                    
                
                Spacer()
               
                HStack(spacing: 20){
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


func typeWriter(at position: Int = 0) {
      if position == 0 {
          text = ""
      }
      if position < finalText.count {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
              text.append(finalText[position])
              typeWriter(at: position + 1)
          }
      }
  }
}




extension String {
  subscript(offset: Int) -> Character {
      self[index(startIndex, offsetBy: offset)]
  }
}

