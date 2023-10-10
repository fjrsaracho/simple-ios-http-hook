//
//  NotificationError.swift
//  simple-ios-http-hook Watch App
//
//  Created by Javier Ruiz on 10/10/23.
//

import Foundation

func notificationError() {
    DispatchQueue.main.async {
        withAnimation(.linear(duration: 05.0)) {
            self.isIconHidden = false
            self.errorIconColor = .white
        }
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 05.0) {
        withAnimation(.easeOut(duration: 5.0)) {
            self.isIconHidden = true
            self.errorIconColor = .red
        }
    }
}
