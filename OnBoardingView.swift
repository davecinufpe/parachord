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
            
            ZStack (alignment: .bottomLeading) {
                
                Color("bg").edgesIgnoringSafeArea(.all)
                
                
                HStack () {
                    Text("Welcome to Parachord!")
                        .font(.largeTitle)
                        .bold()
                    
                    VStack {
                        
                        Button(action: {
                            path.append(Fluxo.HowToPlay)
                        }) {
                            Text("How to play")
                            
                                .font(.system(.body, design: .monospaced))
                                .padding()
                                .frame(width: 400, height: 50)
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                            
                        }
                        Button(action: {
                            path.append(Fluxo.StartGame)
                        }) {
                            Text("PLAY")
                                .font(.system(.body, design: .monospaced))
                                .padding()
                                .frame(width: 400, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(50)
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
                    
                }.border(Color.black, width: 1)
                    .padding()
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
