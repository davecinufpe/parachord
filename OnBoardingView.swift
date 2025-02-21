//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

enum Fluxo: Hashable {
    case FirstView
    case HowToPlay
    case ChordsGuide
    case StartGame
}

struct OnBoardingView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            ZStack {
                
                Color("bg").ignoresSafeArea()
                
                Image("onboardingImage")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,120)
                
                // Texto no canto inferior esquerdo
                HStack (alignment: .bottom) {
                    Text("Parachord!")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 20) // Ajustando a distância da borda
                }
                .padding(.bottom, 40) // Ajuste da distância da parte inferior da tela
                .frame(maxWidth: .infinity, alignment: .bottomLeading)

                
                VStack (spacing: 20) {
                    Spacer()
                    
                 
                    Button(action: {
                        path.append(Fluxo.HowToPlay)
                    }) {
                        Text("How\n to play")
                            .font(.system(.body, design: .monospaced))
                            .frame(width: 320, height: 120, alignment: .center)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                            .clipShape(Circle()) // Forma circular
                            .overlay(
                                Circle().stroke(Color("customButton1"), lineWidth: 2) // Borda do botão
                            )
                            .shadow(color: .gray, radius: 2, x: -5, y: 5) // Sombra
                    }
                    
                  
                    Button(action: {
                        path.append(Fluxo.StartGame)
                    }) {
                        Text("PLAY")
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .frame(width: 400, height: 180)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                            .clipShape(Circle()) // Forma circular
                            .overlay(
                                Circle().stroke(Color("c"), lineWidth: 2) // Borda do botão
                            )
                            .shadow(color: .gray, radius: 2, x: -5, y: 5) // Sombra
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 40)
                
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
