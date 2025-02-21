//
//  CloudsMovingView 2.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 20/02/25.
//


import SwiftUI

struct CloudsMovingView: View {
    @State private var moveToTheLeft = false
    let cloudImage = Image("clouds") // Certifique-se de que esta imagem esteja no seu catálogo de assets
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Primeira imagem começando à direita
                cloudImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.moveToTheLeft ? geometry.size.width : 0) // Começando à direita
                    .animation(Animation.linear(duration: 30).repeatForever(autoreverses: false), value: moveToTheLeft)
                
                
            }
            .onAppear {
                self.moveToTheLeft = true // Inicia a animação para mover para a esquerda quando a view aparecer
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CloudsMovingView()
    }
}

