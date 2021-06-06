//
//  UserProfileView.swift
//  IntermediateLevel
//
//  Created by Deepak on 28/05/21.
//

import SwiftUI

struct UserPhotosView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var thisUser: ChatModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 35, height: 15)
                .foregroundColor(.accentColor)
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            
            TabView {
                ForEach(0 ..< thisUser.image.count) { pic in
                    Image(thisUser.image[pic])
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFit()
                        .padding()
                        .shadow(color: .black, radius: 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct UserPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        let dummy = ChatViewModel()
        UserPhotosView(thisUser: dummy.chatViewModel[0])
    }
}
