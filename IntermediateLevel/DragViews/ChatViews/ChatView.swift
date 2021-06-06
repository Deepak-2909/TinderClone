//
//  ChatView.swift
//  IntermediateLevel
//
//  Created by Deepak on 28/05/21.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatVM = ChatViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    //@State var chatModel: [ChatModel] = testData
    
    var body: some View {
        NavigationView {
            //Text("You have no new messages!")
            List{
                ForEach(chatVM.chatViewModel){ item in
                    NavigationLink(destination: MessagesView(thisUser: item)) {
                        HStack{
                            Image(item.image[0])
                                .resizable()
                                .frame(width: 70, height: 70)
                                .cornerRadius(12.0)
                            
                            VStack(alignment: .leading){
                                Text(item.name)
                                    //.bold()
                                    .foregroundColor(.primary)
                                    .font(.title)
                                    
                                Text(item.message)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
                .navigationBarTitle(("Messages"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Image(systemName: "x.circle")
                }))
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
