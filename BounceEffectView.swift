//
//  BounceEffectView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 14/02/25.
//


import SwiftUI

struct BounceEffectView: View {
    @State private var offset: CGFloat = 0
    @State private var parachutistPosition = CGPoint(x: 420, y: 60) // Posição inicial do paraquedista
    @State private var parachutistImage = "skydiver" // Imagem inicial do paraquedista
    @State private var moveParachutist = false // Controla a animação de queda do paraquedista
    
    @State var message: String = ""// Recebe a mensagem por binding

    @State private var firstTimer: Bool = true
    
    @State var attempts: Int = 0
    @State var correctAttempts: Int = 0
    let ATTEMPT_COUNTER: Int = 7
    @State var scoreSheet: Bool = false

    let bounceHeight: CGFloat = 20 // Raio do balanço

    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
        
                Image("airplane")
                    .resizable()
                    .frame(width: 320, height: 120)
                
                Spacer()
                
         
                Image(parachutistImage)
                    .resizable()
                    .frame(width: parachutistImage == "paraquedista_com_paraquedas_aberto" ? 250 : 110, // Tamanho maior quando a imagem for paraquedas aberto
                               height: parachutistImage == "paraquedista_com_paraquedas_aberto" ? 260 : 50) // Tamanho maior
                    
                    .offset(y: offset) // Efeito de balanço
                    .position(parachutistPosition)
                    .onAppear {
                        startInitialFall() // Inicia a queda inicial
                        startBouncing() // Inicia o balanço
                    
                        
                    }
                
                Spacer()

                BotoesNotas(parachutistPosition: $parachutistPosition, actionMoveParachutist: actionMoveParachutist, firstTimer: $firstTimer)
            }
        }.sheet(isPresented: $scoreSheet) {ScoreSheetView(resultText: "\(correctAttempts)/\(attempts)")}
    }
    

    
    
    // Inicia a queda inicial do paraquedista
    func startInitialFall() {
        withAnimation(
            Animation.easeOut(duration: 2) // Duração da queda inicial
        ) {
            parachutistPosition = CGPoint(x: 400, y: 400) // Posição final para a queda inicial
        }
    }
    
    // Inicia o balanço do paraquedista
    func startBouncing() {
        withAnimation(
            Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)
        ) {
            offset = -bounceHeight
        }
    }
    
    // Para o balanço
    func stopBouncing() {
        offset = 0
    }
    
    // Animação de queda com paraquedas
    func startParachuteFall() {
        withAnimation(
            Animation.linear(duration: 4)
        ) {
            parachutistPosition = CGPoint(x: parachutistPosition.x - 10, y: parachutistPosition.y + 10)
        }
    }

    
    
    
    func actionMoveParachutist(isCorrect: Bool) {
        
        parachutistPosition = CGPoint(x: 400, y: 400)
        
        attempts += 1
        if attempts == 7 {
            scoreSheet = true
        }
        
        if isCorrect {
            parachutistImage = "paraquedista_com_paraquedas_aberto"
            correctAttempts += 1
            

            
            withAnimation(
                Animation.linear(duration: 2.5)
            ) {
                parachutistPosition = CGPoint(x: parachutistPosition.x - 580, y: parachutistPosition.y + 700) // Paraquedista vai para a esquerda
            }
        } else {
            // Erro: Move para a direita
            parachutistImage = "skydiver" // Pode manter a imagem inicial ou mudar para uma imagem de erro
            withAnimation(
                Animation.linear(duration: 2.5)
            ) {
                parachutistPosition = CGPoint(x: parachutistPosition.x + 1240, y: parachutistPosition.y + 1400) // Paraquedista vai para a direita
            }
            
            // Adiciona a rotação quando o paraquedista vai para a direita
            withAnimation(
                Animation.linear(duration: 1.5).repeatForever(autoreverses: false)
            ) {
               
        
            }
        }
        
        // Após o movimento, reinicia a queda e o balanço
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Espera a animação de movimento terminar
            
            // Antes de reiniciar a animação de queda, muda a imagem para "skydiver"
            parachutistImage = "skydiver" // Garantir que a imagem volte para o estado inicial
            
            // Reinicia a posição do paraquedista para o topo
            parachutistPosition = CGPoint(x: 490, y: 40)
            
            // Reinicia as animações de queda e balanço
            startInitialFall()  // Inicia a queda
            // Reinicia a animação de balanço (verifique se a animação está acontecendo novamente)
                    offset = 0 // Reinicia o offset para garantir que o efeito de balanço aconteça desde o início
                    startBouncing()     // Inicia o balanço
        }
    }

    }



#Preview {
//    BounceEffectView(message: .constant("Você acertou! 🎉"))
    BounceEffectView()
}
