//
//  BounceEffectView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 14/02/25.
//


import SwiftUI

struct MainGameView: View {
    @State private var offset: CGFloat = 0
    @State private var parachutistPosition = CGPoint(x: 420, y: 60)
    @State private var parachutistImage = "skydiver"
    @State private var moveParachutist = false
    
    @State var message: String = ""
    @State var isGamePaused: Bool = false
    
    @State private var firstTimer: Bool = true
    
    @State var attempts: Int = 0
    @State var correctAttempts: Int = 0
    let ATTEMPT_COUNTER: Int = 5
    @State var scoreSheet: Bool = false
    
    let BOUNCE_HEIGHT: CGFloat = 20
    
    @State private var isRotating: Bool = false
    @State private var angleDegrees: Double = 0.0
    
    
    
    @Binding var path: NavigationPath
    
    
    var body: some View {
        ZStack {
            
            Color("bg").edgesIgnoringSafeArea(.all)
            
            CloudsMovingView()
            
            VStack {
                
                Image("airplane")
                    .resizable()
                    .frame(width: 420, height: 180)
                    .padding(.top)
                
                Spacer()
                
                
                Image(parachutistImage)
                    .resizable()
                
                    .frame(width: parachutistImage == "paraquedista_com_paraquedas_aberto" ? 250 : 110,
                           height: parachutistImage == "paraquedista_com_paraquedas_aberto" ? 280 : 50)
                    .rotationEffect(Angle(degrees: angleDegrees))
                
                    .offset(y: offset)
                    .position(parachutistPosition)
                    .onAppear {
                        startInitialFall()
                        startBouncing()
                        
                        
                    }
                
                Spacer()
                
                BotoesNotas(parachutistPosition: $parachutistPosition, actionMoveParachutist: actionMoveParachutist, isGamePaused: $isGamePaused, firstTimer: $firstTimer)
            }
        }.sheet(isPresented: $scoreSheet) {
            
            ScoreSheetView(path: $path, resultText: "\(correctAttempts)/\(attempts)")
            
        }
        
        
    }
    
    
    func startInitialFall() {
        withAnimation(
            Animation.easeOut(duration: 2)
        ) {
            parachutistPosition = CGPoint(x: 400, y: 400)
        }
    }
    
    func startBouncing() {
        withAnimation(
            Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)
        ) {
            offset = -BOUNCE_HEIGHT
        }
    }
    
    func stopBouncing() {
        offset = 0
    }
    
    func startParachuteFall() {
        withAnimation(
            Animation.linear(duration: 4)
        ) {
            parachutistPosition = CGPoint(x: parachutistPosition.x - 30, y: parachutistPosition.y + 10)
        }
    }
    
    
    
    
    
    func actionMoveParachutist(isCorrect: Bool) {
        
        parachutistPosition = CGPoint(x: 400, y: 400)
        
        attempts += 1
        if attempts == ATTEMPT_COUNTER {
            isGamePaused = true
            scoreSheet = true
            
        }
        
        
        
        if isCorrect {
            
            parachutistImage = "paraquedista_com_paraquedas_aberto"
            correctAttempts += 1
            
            
            
            withAnimation(
                Animation.linear(duration: 5.5)
                
            ) {
                parachutistPosition = CGPoint(x: parachutistPosition.x - 1580, y: parachutistPosition.y + 500)
                
            }
        } else {
            parachutistImage = "skydiver"
            withAnimation(
                Animation.linear(duration: 2.5)
            ) {
                parachutistPosition = CGPoint(x: parachutistPosition.x + 1940, y: parachutistPosition.y + 1800)
                angleDegrees = 720
            }
            withAnimation(
                Animation.linear(duration: 1.5).repeatForever(autoreverses: false)
                
                
            ) {
                
                
                
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            
            parachutistImage = "skydiver"
            parachutistPosition = CGPoint(x: 690, y: 100)
                
            
            
            startInitialFall()
            
            offset = 0
            startBouncing()
            angleDegrees = 0
            
            
            
        }
    }
    
}



