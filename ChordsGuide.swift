//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct ChordsGuideView: View {
    
    @Binding var path: NavigationPath
    
    let firstGroup: [(String, String)] = [
        ("C Major", "c"),
        ("D Major", "d"),
        ("E Major", "e"),
        ("F Major", "f"),
        ("G Major", "g"),
        ("A Major", "a")
       
    ]
    
    let secondGroup: [(String, String)] = [
        ("C# Major", "c#"),
        ("D# Major", "d#"),
        ("F# Major", "f#"),
        ("G# Major", "g#"),
        ("A# Major", "a#"),
        ("B Major", "b")
    ]
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Chords Guide")
                    .font(.custom(MyCustomFonts.textFont.fontName, size: 24))
                    .frame(width: 400, height: 50)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.black)


                
                ScrollView {

                    
                    VStack {
                        Text("Each button here represents a note and the interval between them is a semitone. \nSince Josh's parachute is only released with major chords, it’s important to know that a major chord consists of: \nThe root, which shares its name with the chord being formed. \nThe third, an interval of 4 semitones from the root. \nThe fifth, an interval of 3 semitones from the third.")
                            .font(.custom(MyCustomFonts.secondFont.fontName, size: 18))
                            .foregroundStyle(Color("buttonColor2"))
                           
                        
                    }
                    
                    HStack {
                        
                     
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(firstGroup, id: \.0) { chord, imageName in
                                VStack {
                                    Text(chord)
                                        .font(.system(.body, design: .monospaced))
                                        
                                    
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 372, height: 96)
                                }

                                .padding(.vertical, 8)
                            }
                        }
                       
                        .frame(maxHeight: .infinity, alignment: .top)
                        
                        Spacer()
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(secondGroup, id: \.0) { chord, imageName in
                                VStack {
                                    Text(chord)
                                        .font(.system(.body, design: .monospaced))
                                    
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 372, height: 96)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                       
                        
                        
                    }
                } .background(Color("bg"))
               
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
                .padding()
                    
            }
                .padding(.horizontal, 36)
        }
    }
    
    
    
    
}
