//
//  DragGesture.swift
//  IntermediateLevel
//
//  Created by Deepak on 27/05/21.
//

import SwiftUI

struct DragGestureTut: View {
    
    @State var cards = ChatViewModel()
    
    @State var showSheetView = false
    @State var showChatView = false
    
    
    
    
    //@State var chatModels: [ChatModel] = testData
    
    
    //let item: ChatModel
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    showSheetView.toggle()
                    
                },
                label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .foregroundColor(.secondary)
                }).sheet(isPresented: $showSheetView) {
                    ProfileView()
                }
                
                
                Spacer()
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .frame(width: 50, height: 55)
                    .foregroundColor(.pink)
                
                Spacer()
                
                Button(action: {
                    showChatView.toggle()
                },
                label: {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .foregroundColor(.secondary)
                }).sheet(isPresented: $showChatView, content: {
                    ChatView()
                })
            }
            .padding(.horizontal)
            .padding(.top)
            Spacer()
            
            ZStack{
//                RoundedRectangle(cornerRadius: 20.0)
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .frame(width: 350, height: 500)
                
                
                ForEach(cards.chatViewModel.reversed()) { card in
                    CardsView(card: card)
                }
                
            }
            
            
            
            Spacer()
               
            HStack{
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.red)
                
                Spacer()
                
                Image(systemName: "star.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.pink)
                
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    
}

struct DragGesture_Previews: PreviewProvider {
//    @State var chatModel: [ChatModel] = testData
//    let item: ChatModel
    static var previews: some View {
        DragGestureTut()
    }
}


struct CardsView: View {
    
    let card: ChatModel
    
    @State var offSet: CGSize = .zero
    @State var angle: Angle = Angle(degrees: 0)
    
    @State var showUserProfileView = false
    
    var body: some View {
        ZStack {
            Image(card.image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(20.0)
//            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .padding(.horizontal)
                .offset(offSet)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                offSet = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                offSet = .zero
                            }
                        }
                )
            
            VStack{
                
                Spacer()
                Button(action: {
                    showUserProfileView.toggle()
                },
                label: {
                    HStack{
                        Text(card.name)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text(card.age)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 25.0)
                    .sheet(isPresented: $showUserProfileView, content: {
                        UserProfileView(thisUser: card)
                    })
                    
                    
                })
                .padding(0.0)
                
                HStack {
                    Text(card.bio)
                        .padding(.horizontal, 25.0)
                        .padding(.bottom)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .offset(offSet)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                offSet = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                offSet = .zero
                            }
                        }
                )
            
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let maxX = UIScreen.main.bounds.width / 2
        //let maxY = UIScreen.main.bounds.height / 2
        let currentAmount = abs(offSet.width)
        let percentage = currentAmount/maxX
        return 1.0 - min(percentage, 0.7) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offSet.width
        let percentage = Double(currentAmount/max)
        let maxAngle = 10.0
        return percentage * maxAngle
    }
}
