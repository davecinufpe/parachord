//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 18/02/25.
//

import SwiftUI



struct ScoreSheetView: View {
    
    @State var resultText: String
    
    var body: some View {
        Text("Parabéns! Voce acertou \(resultText)")
    }
}

