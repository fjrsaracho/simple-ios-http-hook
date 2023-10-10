import SwiftUI

struct ContentView: View {
    @State private var iconColor: Color = .blue
    @StateObject private var toastManager = ToastManager()
    
    var body: some View {
        VStack {
            Image(systemName: "house.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(iconColor)
                .onTapGesture(count: 2) {
                    self.tapHome()
                }
        }.overlay(
            VStack {
                if toastManager.isShowingToast {
                    ToastMessage(isShowing: $toastManager.isShowingToast, message: toastManager.toastMessage)
                        .transition(.move(edge: .top))
                }
                Spacer()
            }
        )
        .frame(width: .infinity, height: .infinity)
    }
    
    func tapHome() {
        self.homeButtonAnimation()
        
        doHttpRequest { success in
            if !success {
                toastManager.showToast(message: "Connection error")
            }
        }
    }
    
    func homeButtonAnimation() {
        DispatchQueue.main.async {
            withAnimation(.linear(duration: 01.0)) {
                self.iconColor = Color.blue.opacity(0.2)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 01.0) {
            withAnimation(.easeOut(duration: 1.0)) {
                self.iconColor = .blue
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
