//
//  ToastView.swift
//  simple-ios-http-hook Watch App
//
//  Created by Javier Ruiz on 10/10/23.
//

import SwiftUI

struct ToastMessage: View {
    @Binding var isShowing: Bool
    let message: String
    let duration: TimeInterval
    
    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .opacity(isShowing ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
        }
    }
}
