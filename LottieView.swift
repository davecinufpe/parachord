//
//  LottieView.swift
//  Paraquedas-challenge
//
//  Created by Deivson Pereira da Silva on 21/02/25.
//


//import SwiftUI
//import Lottie
//
//struct LottieView: UIViewRepresentable {
//    let lottieFile: String
//    var loopMode: LottieLoopMode
//    
//    var animationView = LottieAnimationView()
//    
//    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
//        let view = UIView(frame: .zero)
//        
//        animationView.animation = LottieAnimation.named(lottieFile)
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = loopMode
//        animationView.play()
//        
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//        
//        NSLayoutConstraint.activate([
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
//}
