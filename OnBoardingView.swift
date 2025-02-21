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
                
                
                VStack () {
                    Text("Parachord")
                        .font(.custom(MyCustomFonts.textFont.fontName, size: 60))
                }
                .border(Color.red, width: 1)
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                
                
                
                
                VStack (alignment: .trailing, spacing: 20){
                        Spacer()
                        
                        Button(action: {
                            path.append(Fluxo.HowToPlay)
                        }) {
                            Text("How\n to play")
                                .font(.system(.body, design: .monospaced))
                                .frame(width: 400, height: 120, alignment: .center)
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                .clipShape(Circle()) // Forma circular
                                .overlay(
                                    Circle().stroke(Color("buttonColor1"), lineWidth: 2) // Borda do botão
                                )
                                .shadow(color: .gray, radius: 2, x: -5, y: 5) // Sombra
                            
                        }
                        Button(action: {
                            path.append(Fluxo.StartGame)
                        }) {
                            Text("PLAY")
                                .font(.system(.body, design: .monospaced))
                                .frame(width: 400, height: 180)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                .clipShape(Circle()) // Forma circular
                                .overlay(
                                    Circle().stroke(Color("buttonColor1"), lineWidth: 2) // Borda do botão
                                )
                                .shadow(color: .gray, radius: 2, x: -5, y: 5) // Sombra
                        }
                        .navigationDestination(for: Fluxo.self ){
                            fluxo in switch fluxo {
                            case .FirstView:
                                OnBoardingView()
                            case .HowToPlay:
                                HowToPlay(path: $path)
                            case .ChordsGuide:
                                ChordsGuideView(path: $path)
                            case .StartGame:
                                MainGameView(path: $path)
                            }
                        }
                        
                    
                }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                  .padding(.trailing, -20)
                                  .padding(.bottom, 40)
                    .navigationDestination(for: Fluxo.self ){
                        fluxo in switch fluxo {
                        case .FirstView:
                            OnBoardingView()
                        case .HowToPlay:
                            HowToPlay(path: $path)
                        case .ChordsGuide:
                            ChordsGuideView(path: $path)
                        case .StartGame:
                            MainGameView(path: $path)
                         
                        }
                    }
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
#Preview {
    OnBoardingView()
}
