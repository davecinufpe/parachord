import SwiftUI

@main
struct MyApp: App {
    
    init(){
        FontLoader.registerFonts()
        }
    
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
        }
    }
}

