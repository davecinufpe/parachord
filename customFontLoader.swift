//
//  SwiftUIView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 21/02/25.
//

import SwiftUI

class customFontLoader {
    @MainActor static let shared = FontLoader()

    func loadFirstFont() {
        if let cfURL = Bundle.main.url(forResource: "BungeeShade-Regular", withExtension: "ttf") as CFURL? {
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        }
    }

    func loadSecondFont() {
        if let cfURL = Bundle.main.url(forResource: "IBMPlexMono-Regular", withExtension: "ttf") as CFURL? {
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        }
    }
}
