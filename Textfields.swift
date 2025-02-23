//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 14/02/25.
//

import SwiftUI

struct Textfields: View {
    @Binding var code: [String?]
    
    var body: some View {
        HStack {
            ForEach(code, id: \.self) { note in
                Text(note ?? "_") 
                    .font(.title)
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    Textfields(code: .constant([nil, nil, nil]))
}
