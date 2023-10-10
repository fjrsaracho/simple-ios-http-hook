import SwiftUI

class ToastManager: ObservableObject {
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    
    func showToast(message: String) {
        toastMessage = message
        isShowingToast = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation {
                self.isShowingToast = false
            }
        }
    }
}

struct ToastMessage: View {
    @Binding var isShowing: Bool
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.red.opacity(0.9))
            .cornerRadius(5)
            .padding(.horizontal, 2)
            .opacity(isShowing ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }
}
