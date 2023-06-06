

import SwiftUI

struct Login: View {
    @State var UserName = ""
    @State var Password = ""
 

    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.pink.opacity(0.2))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
      
            VStack{
                Spacer()
                Text("LOGIN")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("-- ")
                    .foregroundColor(Color.gray)
                TextField("UserName", text: $UserName)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowModifier1())
                    .padding(.bottom, 20)
                SecureField("Password", text: $Password)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowModifier1())
                    .padding(.bottom, 20)
               
               
                HStack {
                    Button(action: {
                        print("UserName \(UserName)")
                        print("Password \(Password)")
                     
                    }, label: {
                        Text("Sign In")
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
}
struct InnerShadowModifier1: ViewModifier {
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

struct ShadowModifier1: ViewModifier {
  func body(content: Content) -> some View {
    content
       .shadow(color: Color("L"), radius: 8, x: -8, y: -8)
       .shadow(color: Color("D"), radius: 8, x: 8, y: 8)
  }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
