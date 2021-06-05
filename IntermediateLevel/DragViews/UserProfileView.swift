//
//  UserProfileView.swift
//  IntermediateLevel
//
//  Created by Deepak on 28/05/21.
//

import SwiftUI

struct UserProfileView: View {
    
    //@Environment(\.presentationMode) var presentationMode
    var thisUser: ChatModel
    
    var body: some View {
        
        VStack{
            Image(thisUser.image)
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let dummy = ChatViewModel()
        UserProfileView(thisUser: dummy.chatViewModel[0])
    }
}
