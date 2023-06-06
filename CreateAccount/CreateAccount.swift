
import SwiftUI
import FirebaseAuth
struct Register: View {
    @State var Email = ""
    @State var Password = ""
    @State var ConfirmPassword = ""

    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.pink.opacity(0.2))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
      
            VStack{
                Spacer()
                Text("REGISTER")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Create your new account ")
                    .foregroundColor(Color.gray)
                TextField("Email", text: $Email)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowModifier())
                    .padding(.bottom, 20)
                    .keyboardType(.numbersAndPunctuation)
                    .textContentType(.username)
                SecureField("Password", text: $Password)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowModifier())
                    .padding(.bottom, 20)
                SecureField("Confirm Password", text: $ConfirmPassword)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowModifier())
                    .padding(.bottom, 20)
               
                HStack {
                    Button(action: {
                       let impact =  UIImpactFeedbackGenerator(style: .heavy )
                      impact.impactOccurred()
                       CreateAacount()
                    }, label: {
                        Text("Sign up")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width:210 , height: 50)
                           .background(Color.white)
                           .cornerRadius(5)
                    }).foregroundColor(.black.opacity(0.8))
                      //  .padding()
                  // .modifier(InnerShadowModifier())
                }
                Spacer()
            }.padding(30)
        }
    }
    private func CreateAacount(){
        
        if Password != ConfirmPassword {return}
        if Password.isEmpty {return}
        Auth.auth().createUser(withEmail: Email, password: Password) { authResult, error in
            if let err = error{
                print("Error: \(err.localizedDescription)")
                return
            }
            print("Successfully Registered user ")
        }
        
    }
}
struct InnerShadowModifier: ViewModifier {
@State var radius: CGFloat = 10
func body(content: Content) -> some View {
content
.overlay(
RoundedRectangle(cornerRadius: radius)
 .stroke(Color("Color 1"), lineWidth: 4)
 .shadow(color: Color("Color 1"), radius: 10, x: 10, y: 10)
 .clipShape(RoundedRectangle(cornerRadius: radius))
 .shadow(color: Color("Color 1"), radius: 10, x: 5, y: 5)
 .clipShape(RoundedRectangle(cornerRadius: radius)))
}}

struct ShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
       .shadow(color: Color("L"), radius: 8, x: -8, y: -8)
       .shadow(color: Color("D"), radius: 8, x: 8, y: 8)
  }
}

extension View{
    
    func Haptic(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View{
        
        self.onTapGesture {
            let impact =  UIImpactFeedbackGenerator(style: .heavy )
        }
    }
}
struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
