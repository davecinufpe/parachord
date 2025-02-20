//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

struct CustomButtonWhiteNotesCG: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 24))
                .foregroundColor(.black)
                .frame(width: 72, height: 72)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color("buttonColor1"), lineWidth: 2)
                )
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
        }
    }
}

struct CustomButtonBlackNotesCG: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20)) // Ajuste o tamanho da letra
                .foregroundColor(.accentColor) // Cor do texto
                .frame(width: 72, height: 72) // Tamanho do botão
                .background(Color("buttonColor2")) // Cor do fundo do botão
                .clipShape(Circle()) // Forma circular
                .overlay(
                    Circle().stroke(Color("gray"), lineWidth: 2) // Borda do botão
                )
                .shadow(color: .gray, radius: 2, x: -5, y: 5) // Sombra
        }
    }
}

struct ChordsGuideView: View {
    
    // Adicionando os acordes acidentados (com # e b)
    let chords: [String: [String]] = [
        "C Major": ["C", "E", "G"],
        "C# Major": ["C#", "F", "G#"], // Acorde acidentado C#
        "D Major": ["D", "F#", "A"],
        "D# Major": ["D#", "G", "A#"], // Acorde acidentado D#
        "E Major": ["E", "G#", "B"],
        "F Major": ["F", "A", "C"],
        "F# Major": ["F#", "A#", "C#"], // Acorde acidentado F#
        "G Major": ["G", "B", "D"],
        "G# Major": ["G#", "C", "D#"], // Acorde acidentado G#
        "A Major": ["A", "C#", "E"],
        "A# Major": ["A#", "D", "F"], // Acorde acidentado A#
        "B Major": ["B", "D#", "F#"]
    ]
    
    var body: some View {
        
        
        ZStack {
            
            Color("bg").edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 16) {
                
                Text("Chords Guide")
                    .font(.largeTitle)
                    .padding()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Loop para criar a lista de acordes
                        ForEach(chords.keys.sorted(), id: \.self) { chord in
                            HStack  {
                                // Imagem do avião
                                Image("airplane")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                
                                // Exibe o nome do acorde
                                Text(chord)
                                    .font(.title)
                                    .foregroundColor(.blue)
                                
                                // Exibe as notas do acorde
                                ForEach(chords[chord]!, id: \.self) { note in
                                    // Verifica se a nota é acidentada (com sustenido ou bemol)
                                    if note.contains("#") || note.contains("b") {
                                        CustomButtonBlackNotesCG(title: note) {
                                            // Ação do botão de nota acidentada
                                        }
                                    } else {
                                        CustomButtonWhiteNotesCG(title: note) {
                                            // Ação do botão de nota natural
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                  
                }
            }//
            Button(action: {
                // Ação do botão Start
            }) {
                Text("Start")
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    ChordsGuideView()
}
