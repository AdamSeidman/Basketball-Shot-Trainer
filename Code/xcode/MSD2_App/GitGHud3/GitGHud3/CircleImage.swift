//
//  CircleImage.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/2/21.
//

import SwiftUI


struct CircleImage: View {
    var body: some View {
        Image("default_coach_image")
            .frame(width: 30, height: 30)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 4)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
