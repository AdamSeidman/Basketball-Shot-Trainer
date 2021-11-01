//
//  Select_Coach.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct Select_Coach: View {
    var body: some View {
        
        
        ZStack{
            Image("blue_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack{
                    
                Spacer()
                
                Image("image2")
                
                Spacer()
                
                Text("coach 1")
                    .padding(.bottom, 3.0)
                    
                
                Text("coach 2")
                
                Spacer()
                
                
            }
            
            
        }
    }
}

struct Select_Coach_Previews: PreviewProvider {
    static var previews: some View {
        Select_Coach()
    }
}
