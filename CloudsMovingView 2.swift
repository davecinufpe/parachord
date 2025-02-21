//
//  CloudsMovingView 2.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 20/02/25.
//

import SwiftUI

struct CloudsMovingView: View {
    @State private var moveToTheLeft = false
    let cloudImage = Image("clouds")
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                // Primeira imagem
                cloudImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.moveToTheLeft ? geometry.size.width : 0) // Mover para a esquerda
                    .animation(Animation.linear(duration: 30).repeatForever(autoreverses: false), value: moveToTheLeft)
                
                // Segunda imagem
            }
            .onAppear {
                self.moveToTheLeft = true // Inicia a animação para mover para a esquerda quando a view aparecer
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CloudsMovingView()
}
