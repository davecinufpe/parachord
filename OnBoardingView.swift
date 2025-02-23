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
                            Text("How to play")
                                .font(.system(.body, design: .monospaced))
                                .frame(width: 240, height: 60)
                                .background(Color("buttonColor"))
                                .foregroundColor(.black)
                                .cornerRadius(12)
                                .clipShape(Rectangle())
                                .shadow(color: .gray, radius: 2, x: -5, y: 5)
                            
                            
                        }
                        Button(action: {
                            path.append(Fluxo.StartGame)
                        }) {
                            Text("PLAY")
                                .font(.system(.body, design: .monospaced))
                                .frame(width: 240, height: 60)
                                .background(Color("buttonColor"))
                                .foregroundColor(.black)
                                .cornerRadius(12)
                                .clipShape(Rectangle())
                                .shadow(color: .gray, radius: 2, x: -5, y: 5)
                            
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
                                  .padding(.trailing, 80)
                                  .padding(.bottom, 80)
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
