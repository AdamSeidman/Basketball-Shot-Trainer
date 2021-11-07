
import SwiftUI

struct Title_Screen_View: View {
    @EnvironmentObject var select:NavigationSelector
    var body: some View {
        NavigationView{
            VStack{
                Image("image2")
                //Spacer()
                Button("Tap to begin"){
                    select.select = "select coach"
                }
                .buttonStyle(DefaultButtonStyle())
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}



