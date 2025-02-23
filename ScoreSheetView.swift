//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 18/02/25.
//

import SwiftUI

struct ScoreSheetView: View {
    
    @Binding var path: NavigationPath
    
    @State var resultText: String
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        ZStack {
            
            Image("sheetBanner")
                .resizable()
                .frame(width: 700, height: 700)
                .padding(.leading, 20)
            
            VStack {
                Text("\(resultText)")
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .frame(width: 180, height: 80)
                    .foregroundColor(.accentColor)
                
            }
            //            .border(Color.red, width: 2)
            .padding(.leading, -230)
            .padding(.top, 240)
            
            
            
            VStack (spacing: 12){
                Button(action: {
                    dismiss()
                    path.append(Fluxo.StartGame)
                }) {
                    Text("Play again")
                        .font(.system(.body, design: .monospaced))
                        .frame(width: 240, height: 60)
                        .background(Color("buttonColor"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .clipShape(Rectangle())
                        .shadow(color: .gray, radius: 2, x: -5, y: 5)
                }
                
                Button(action: {
                    dismiss()
                    path.append(Fluxo.ChordsGuide)
                }) {
                    Text("Chords Guide")
                        .font(.system(.body, design: .monospaced))
                        .frame(width: 240, height: 60)
                        .background(Color("buttonColor"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .clipShape(Rectangle())
                        .shadow(color: .gray, radius: 2, x: -5, y: 5)
                }
                    
                    Button(action: {
                        dismiss()
                        path.append(Fluxo.FirstView)
                    }) {
                        Text("Sair")
                            .font(.system(.body, design: .monospaced))
                            .frame(width: 240, height: 60)
                            .background(Color("buttonColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .clipShape(Rectangle())
                            .shadow(color: .gray, radius: 2, x: -5, y: 5)
                        
                    }
                }
                    .padding(.leading, 300)
                
                Spacer()
            }
            .frame(width: 600, height: 300)  // Ajuste o tamanho da Sheet
            
        }

    
}

