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
                .font(.system(.title3, design: .monospaced)) // Fonte monospaced
                .foregroundColor(.black)
   
            
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

