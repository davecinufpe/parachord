//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 19/02/25.
//

import SwiftUI

enum Rota: Hashable {
    case inicio
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
                            path.append(Rota.inicio)
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
                            path.append(Rota.inicio)
                        }) {
                            Text("PLAY")
                                .font(.system(.body, design: .monospaced))
                                .padding()
                                .frame(width: 400, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        .navigationDestination(for: Rota.self ){
                            rota in switch rota {
                            case .inicio:
                                BounceEffectView()
                            }
                        }
                        
                    }
                    
                }.border(Color.black, width: 1)
                    .padding()
                    .navigationDestination(for: Rota.self ){
                        rota in switch rota {
                        case .inicio:
                            HowToPlay()
                        }
                    }
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
