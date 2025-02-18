//
//  Sound.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 14/02/25.
//


import AVFoundation
import SwiftUI

@MainActor
class Sound {
    
    private var player: AVAudioPlayer?
    
    func play(note: String) {
        guard let soundFile = NSDataAsset(name: note) else { return }
        do {
            player = try AVAudioPlayer(data: soundFile.data)
            player?.prepareToPlay()
            player?.play()
        }
        catch {
            print("Error playing sound: \(error)")
        }
        
    }
}
