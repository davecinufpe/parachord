//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 18/02/25.
//

import SwiftUI

struct ScoreSheetView: View {
    
    @Binding var path: NavigationPath
    
    @State var resultText: String
    
    @Environment(\.dismiss) var dismiss
  
    
    var body: some View {
        
        VStack {
            
            Text("\(resultText)")
                .font(.system(.title, design: .monospaced))
                .frame(width: 400, height: 180)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(50)
                .clipShape(Rectangle())
                .overlay(
                    Rectangle().stroke(Color("buttonColor1"), lineWidth: 2)
                )
                .shadow(color: .gray, radius: 2, x: -5, y: 5)
            
            
            Spacer()
            
            // Botões
            VStack(spacing: 20) {
                // Botão Voltar para o Jogo
                Button(action: {
                    dismiss()
                    path.append(Fluxo.StartGame)
                }) {
                    Text("Play again")
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                
                }
                
                
                Button(action: {
                    dismiss()
                    path.append(Fluxo.ChordsGuide)
                }) {
                    Text("Chords Guide")
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
               
                    
                    Button(action: {
                        dismiss()
                        path.append(Fluxo.FirstView)
                    }) {
                        Text("Sair")
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                 
                    .padding()
                    
                    Spacer()
                }
                .frame(width: 350, height: 500)  // Ajuste o tamanho da Sheet
                .background(Color.gray.opacity(0.2)) // Fundo cinza levemente
                .cornerRadius(20) // Bordas arredondadas
                .shadow(radius: 10) // Sombras para dar efeito de painel
            }
        }
}

