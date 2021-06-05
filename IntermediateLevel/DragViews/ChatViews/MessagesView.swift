//
//  MessagesView.swift
//  IntermediateLevel
//
//  Created by Deepak on 30/05/21.
//

import SwiftUI

struct MessagesView: View {
    
    var thisUser: ChatModel
    //@State var chatModels: [ChatModel] = testData
    @State private var text: String = ""
    @State var text1: [String] = []
    @State var printText: Bool = false
    @State var index: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
            
                if printText == false {
                    Text("You have no new messages!")
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    if printText{
//                        VStack {
                            Text(text1[index])
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(15.0)
                        }
                        //index += 1
                        //increment()
//                    }
                    
//                    .onAppear(perform: {
//                        index += 1
//                    })
//
                }
                
                
                HStack{
                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.horizontal, 5.0)
                        .foregroundColor(.secondary)
                    
                    
                    Image(systemName: "smiley.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
//                        .padding(.horizontal, 0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9707849622, green: 0.6056339547, blue: 0, alpha: 1)))
                        .onTapGesture {
                            text.append("🌝")
                        }
                    
                    TextField("Say hii!", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.horizontal, 5.0)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            printText = true;
                            if true{
                                text1.append(text)
                                text = ""

                            }
                            
                        }
                }
                .padding()
                    
            }
            .navigationBarTitle((thisUser.name), displayMode: .inline)
        }
        
    }
    func increment() {
        return index += 1
    }
}



struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        // dummy user for preview
        let dummy = ChatViewModel()
        MessagesView(thisUser: dummy.chatViewModel[0])
    }
}
