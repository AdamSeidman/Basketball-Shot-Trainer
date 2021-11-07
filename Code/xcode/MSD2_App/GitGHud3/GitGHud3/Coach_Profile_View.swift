//
//  Coach_Profile_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/2/21.
//

import SwiftUI
import UIKit

struct Coach_Profile_View: View {
    @Environment(\.managedObjectContext) var moc
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var selectedData: DataSelection
    @EnvironmentObject var select: NavigationSelector
    
    
    @State var changeProfileImage = false
    @State var openCamera = false
    @State var openPhotoLib = false
    @State private var imageChanged = true
    @State var imageSelected = UIImage()
    @State private var genericBin = Data(count: 1)
    
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button("Title Screen"){
                        self.select.select = "title screen"
                    }
                    Spacer()
                }
                ForEach(coaches){ coach in
                    if coach.id == self.selectedData.coachID {
                        Menu {
                            Button("Choose image from photo library") {
                                openPhotoLib = true
                                changeProfileImage = true
                            }
                            Button("Take new picture") {
                                openCamera = true
                                changeProfileImage = true
                            }
                            .sheet(isPresented: $openCamera) {
                                 ImagePicker(selectedImage: $imageSelected,
                                     sourceType: .camera)
                                 .onDisappear(perform: {
                                     coach.profileImage = imageSelected.jpegData(compressionQuality: 1.0)
                                     try? self.moc.save()
                                 })
                             }
                             .sheet(isPresented: $openPhotoLib) {
                                 ImagePicker(selectedImage: $imageSelected,
                                     sourceType: .photoLibrary)
                                 .onDisappear(perform: {
                                     coach.profileImage = imageSelected.jpegData(compressionQuality: 1.0)
                                     try? self.moc.save()
                                 })
                             }
                        } label: {
                            Image(uiImage:UIImage(data: coach.profileImage ?? genericBin, scale:1.0) ?? UIImage(named: "default_coach_image")!)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 7)
                        }
                    }
                }
                HStack{
                    //Text(self.coach.firstName ?? "")
                    //Text(self.coach.lastName ?? "")
                }
                Spacer()
                Button("Select Team"){
                    self.select.select = "select team"
                }
                .padding(.top)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

