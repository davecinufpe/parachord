//
//  CustomButton.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 14/02/25.
//

import SwiftUI


struct CustomButtonWhiteNotes: View {
    var title: String
    var action: () -> Void
    
        
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 24))
                .foregroundColor(.black)
                .frame(width: 72, height: 72)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color("buttonColor1"), lineWidth: 2)
                )
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
        }
    }
}

struct CustomButtonBlackNotes: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20))
                .foregroundColor(.accentColor)
                .frame(width: 72, height: 72)
                .background(Color("buttonColor2"))
                .clipShape(Circle()) // Forma circular
                .overlay(
                    Circle().stroke(Color("gray"), lineWidth: 2)
                )
                .shadow(color: .gray, radius: 2, x: -5, y: 5) 
        }
    }
}




import SwiftUI

struct BotoesNotas: View {
    @State private var code: [String?] = [nil, nil, nil]
    @State private var message: String = ""
    @Binding var parachutistPosition: CGPoint
    @State private var firstNote: String = ""
    var actionMoveParachutist: (Bool) -> Void
    private let notePlayer = Sound()
    
    @State private var showErrorSheet: Bool = false
    @State private var errorMessage: String = ""
   @Binding var isGamePaused: Bool
    
    private let allWhiteNotes = ["C", "D", "E", "F", "G", "A", "B"]
    private let allBlackNotes = ["C#", "D#", "F#", "G#", "A#"]
    
    @State private var correctSequence: [String] = []
    
    @State private var remainingTime: Int = 15
    @State private var timer: Timer? = nil
    @Binding var firstTimer: Bool
    


    
    var body: some View {
     
            
            Text("Chord: \(firstNote)")
                .frame(alignment: .center)
                .font(.custom(MyCustomFonts.secondFont.fontName, size: 24))
            
        
            Spacer()
        
        VStack {
          
              
            HStack {
                TimerView(remainingTime: $remainingTime)
                
                Textfields(code: $code)
                
            }
            .padding()
            
            Text(message)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .monospaced()
            
        
            HStack(spacing: 12){
                ForEach(allBlackNotes, id: \.self) { note in
                    if note == allBlackNotes[1] {
                        CustomButtonBlackNotes(title: note, action: {
                            if !isGamePaused {
                                self.playAndFillCode(note: note)
                            }
                        })
                        .padding(.trailing, 80)
                    } else {
                        CustomButtonBlackNotes(title: note, action: {
                            if !isGamePaused {
                                self.playAndFillCode(note: note)
                            }
                        })
                    }
                }
            }

            .padding(.top, 12)
         
            HStack(spacing: 12) {
                ForEach(allWhiteNotes, id: \.self) { note in
                    CustomButtonWhiteNotes(title: note) {
                        if !isGamePaused {
                            self.playAndFillCode(note: note)
                        }
                    }
                }
                
            } .padding(.bottom, 24)
        }
        .onAppear {
            self.generateNewSequence()
            if firstTimer == true {
                startTimer()
                firstTimer.toggle()
            }
        }
        .onChange(of: parachutistPosition) { newPosition in
            if newPosition == CGPoint(x: 490, y: 100) {
                resetTimer()
            }
        }
        .onChange(of: isGamePaused) { newValue in
            pauseGame()
        }
    }
    
    func pauseGame() {
         isGamePaused = true
         timer?.invalidate()
     }
    
    
    func resetTimer() {
        remainingTime = 15
        timer?.invalidate()
        startTimer()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task { @MainActor in
                if self.remainingTime > 1 {
                    self.remainingTime -= 1
                } else {
                    self.timer?.invalidate()
                    self.message = "Noooooooo"
                    parachutistPosition = CGPoint(x: 380, y: 1600)
                    actionMoveParachutist(false)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.resetTimer()
                        self.generateNewSequence()
                    }
                }
            }
        }
    }
    
    func playAndFillCode(note: String) {
        let soundNote = mapNoteToSound(note: note)
        notePlayer.play(note: soundNote)
        fillCode(letter: note)
    }
    
    func mapNoteToSound(note: String) -> String {
        switch note {
        case "C": return "c5"
        case "D": return "d5"
        case "E": return "e5"
        case "F": return "f5"
        case "G": return "g5"
        case "A": return "a5"
        case "B": return "b5"
        case "C#": return "c5sharp"
        case "D#": return "d5sharp"
        case "F#": return "f5sharp"
        case "G#": return "g5sharp"
        case "A#": return "a5sharp"
        default: return ""
        }
    }
    
    func fillCode(letter: String) {
        if let firstEmptyIndex = code.firstIndex(of: nil) {
            code[firstEmptyIndex] = letter
        }
        
        if !code.contains(nil) {
            checkSequence(code: code)
        }
    }
    
    func generateNewSequence() {
        if !isGamePaused {
            let chords: [String: [[String]]] = [
                "C": [["C", "E", "G"], ["C", "G", "E"], ["E", "C", "G"], ["E", "G", "C"], ["G", "C", "E"], ["G", "E", "C"]],
                "D": [["D", "F#", "A"], ["D", "A", "F#"], ["F#", "D", "A"], ["F#", "A", "D"], ["A", "D", "F#"], ["A", "F#", "D"]],
                "E": [["E", "G#", "B"], ["E", "B", "G#"], ["G#", "E", "B"], ["G#", "B", "E"], ["B", "E", "G#"], ["B", "G#", "E"]],
                "F": [["F", "A", "C"], ["F", "C", "A"], ["A", "F", "C"], ["A", "C", "F"], ["C", "F", "A"], ["C", "A", "F"]],
                "G": [["G", "B", "D"], ["G", "D", "B"], ["B", "G", "D"], ["B", "D", "G"], ["D", "G", "B"], ["D", "B", "G"]],
                "A": [["A", "C#", "E"], ["A", "E", "C#"], ["C#", "A", "E"], ["C#", "E", "A"], ["E", "A", "C#"], ["E", "C#", "A"]],
                "B": [["B", "D#", "F#"], ["B", "F#", "D#"], ["D#", "B", "F#"], ["D#", "F#", "B"], ["F#", "B", "D#"], ["F#", "D#", "B"]],
                "C#": [["C#", "F", "G#"], ["C#", "G#", "F#"], ["F", "C#", "G#"], ["F#", "G#", "C#"], ["G#", "C#", "F#"], ["G#", "F#", "C#"]],
                "D#": [["D#", "G", "A#"], ["D#", "A#", "G"], ["G", "D#", "A#"], ["G", "A#", "D#"], ["A#", "D#", "G"], ["A#", "G", "D#"]],
                "F#": [["F#", "A#", "C#"], ["F#", "C#", "A#"], ["A#", "F#", "C#"], ["A#", "C#", "F#"], ["C#", "F#", "A#"], ["C#", "A#", "F#"]],
                "G#": [["G#", "B", "D#"], ["G#", "D#", "B"], ["B", "G#", "D#"], ["B", "D#", "G#"], ["D#", "G#", "B"], ["D#", "B", "G#"]],
                "A#": [["A#", "D", "F"], ["A#", "F", "D"], ["D", "A#", "F"], ["D", "F", "A#"], ["F", "A#", "D"], ["F", "D", "A#"]]
            ]

          
            let allNotes = allWhiteNotes + allBlackNotes
            
           
            self.firstNote = allNotes.randomElement() ?? "C"
            
            self.firstNote = allNotes.randomElement() ?? "C"
            self.correctSequence = chords[firstNote]?.randomElement() ?? ["C", "E", "G"]
            self.code = [nil, nil, nil]
            self.message = ""
        }
    }
    
    func checkSequence(code: [String?]) {
        let userSet = Set(code.compactMap { $0 })
        let correctSet = Set(correctSequence)
        
        if userSet == correctSet {
            message = "Thank you!"
            actionMoveParachutist(true)
           
        } else {
            message = "Noooooooo"
            actionMoveParachutist(false)
       
           }
        if !isGamePaused {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.generateNewSequence()
                resetTimer()
            }
            
        }
    }
}


struct TimerView: View {
    @Binding var remainingTime: Int
    
    var body: some View {
        Text(String(format: "%02d:%02d", remainingTime / 60, remainingTime % 60))  .font(.system(size: 24))
            .foregroundColor(.black)
            .font(.largeTitle)
            .monospaced()
            .frame(width: 120, height: 50)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.leading, -5)
            .padding(.trailing, 40)
    }
}


#Preview {
    BotoesNotas(parachutistPosition: .constant(CGPoint(x: 490, y: 100)), actionMoveParachutist: { _ in }, isGamePaused: .constant(true), firstTimer: .constant(true))
}


