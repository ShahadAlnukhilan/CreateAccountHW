

import SwiftUI


class HapticManger{
    
    static let instance = HapticManger()
    
    func notification(type:UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style )
        generator.impactOccurred()
    }
    
}
struct Haptic: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Haptic_Previews: PreviewProvider {
    static var previews: some View {
        Haptic()
    }
}
