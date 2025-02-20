//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 18/02/25.
//

import SwiftUI



struct ScoreSheetView: View {
    
    @State var resultText: String
    @State private var path = false
    
    var body: some View {
        
        VStack {
            
            Text("\(resultText)")
                .font(.system(.title3, design: .monospaced)) // Fonte monospaced
                .foregroundColor(.black)
            
            Text("Você acertou")
                .font(.system(.title, design: .monospaced))
                .padding()// Fonte monospaced
            
            
            Spacer()
            
            // Botões
            VStack(spacing: 20) {
                // Botão Voltar para o Jogo
                Button(action: {
                    path = true                    // Simulando o retorno para o jogo
                }) {
                    Text("Play again")
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.navigationDestination(isPresented: $path) {
                    BounceEffectView()
                }
                
                
                Button(action: {
                    path = true
                }) {
                    Text("Chords Guide")
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $path) {
                    BounceEffectView()
                }
                    
                    Button(action: {
                        path = true
                    }) {
                        Text("Sair")
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .navigationDestination(isPresented: $path) {
                        OnBoardingView()
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
