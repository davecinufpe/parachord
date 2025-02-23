//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct ChordsGuideView: View {
    
    @Binding var path: NavigationPath
    
    let chordsWithImages: [(String, String)] = [
        ("C Major", "image1"),
           ("C# Major", "image2"),
           ("D Major", "image3"),
           ("D# Major", "image4"),
           ("E Major", "image5"),
           ("F Major", "image6"),
           ("F# Major", "image7"),
           ("G Major", "image8"),
           ("G# Major", "image9"),
           ("A Major", "image10"),
           ("A# Major", "image11"),
           ("B Major", "image12")
    ]
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        Text("Chords Guide")
                            .font(.title)
                            .foregroundColor(.blue)
                        
                        Text(" Trust me, it's easy! First, we need to understand that each button represents a note. The interval between them is a semitone. \n Since my parachute is only released with major chords, it’s important to know that a major chord consists of: \n The root, which shares its name with the chord being formed. \n The third, an interval of 4 semitones from the root. \n The fifth, an interval of 3 semitones from the third.")
                            .font(.system(.body, design: .monospaced))
                        
                      ForEach(chordsWithImages, id: \.0) { word, imageName in
                            HStack {
                              
                                Text(word)
                                    .font(.title)
                                    .foregroundColor(.blue)
                                
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                
                            }
                            .padding(.horizontal)
                        }
                    }
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
                .padding()
            }
        }
    }
}
