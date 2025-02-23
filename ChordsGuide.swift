//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct ChordsGuideView: View {
    
    @Binding var path: NavigationPath
    
    let naturalChordsWithImages: [(String, String)] = [
        ("C Major", "c"),
        ("D Major", "d"),
        ("E Major", "e"),
        ("F Major", "f"),
        ("G Major", "g"),
        ("A Major", "a"),
        ("B Major", "b")
    ]
    
    let accidentalsChordsWithImages: [(String, String)] = [
        ("C# Major", "c#"),
        ("D# Major", "d#"),
        ("F# Major", "f#"),
        ("G# Major", "g#"),
        ("A# Major", "a#")
    ]
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                ScrollView {
                    Text("Chords Guide")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    Text("Trust me, it's easy! First, we need to understand that each button represents a note. The interval between them is a semitone. \nSince my parachute is only released with major chords, it’s important to know that a major chord consists of: \nThe root, which shares its name with the chord being formed. \nThe third, an interval of 4 semitones from the root. \nThe fifth, an interval of 3 semitones from the third.")
                        .font(.system(.body, design: .monospaced))
                        
                    
                    
                    HStack {
                        
                        // Primeira VStack (acordes naturais)
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(naturalChordsWithImages, id: \.0) { chord, imageName in
                                VStack {
                                    Text(chord)
                                        .font(.system(.body, design: .monospaced))
                                    
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 480, height: 120)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                            }
                        }
                        .border(.blue)
                        .frame(maxHeight: .infinity, alignment: .top)
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(accidentalsChordsWithImages, id: \.0) { chord, imageName in
                                VStack {
                                    Text(chord)
                                        .font(.system(.body, design: .monospaced))
                                    
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 480, height: 120)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                            }
                        }
                        .border(.black)
                        .frame(maxHeight: .infinity, alignment: .top) //
                        
                    }
                    .border(.red)
                    
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
            }
        }
    }
    
    
    
    
}
