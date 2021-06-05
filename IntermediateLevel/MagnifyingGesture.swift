//
//  MagnifyingGesture.swift
//  IntermediateLevel
//
//  Created by Deepak on 27/05/21.
//

import SwiftUI

struct MagnifyingGesture: View {
    
    @State var currentValue: CGFloat = 0
    @State var lastValue: CGFloat = 0
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack{
                    Circle()
                        .frame(width: 40, height: 40)
                    Text("NameGoesHere")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                //.background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)))
                    .frame(height: 300)
                    .scaleEffect(1 + currentValue)
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                currentValue = value - 1
                            }
                            .onEnded{ value in
                                withAnimation(.spring()) {
                                    currentValue = 0
                                }
                            }

                    )
                    .gesture(
                        RotationGesture()
                            .onChanged{ value in
                                angle = value
                            }
                            .onEnded{ value in
                                withAnimation {
                                    angle = Angle(degrees: 0)
                                }
                            }
                    )
                    
                HStack{
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble")
                    Image(systemName: "paperplane")
                    Spacer()
                    Image(systemName: "bookmark")
                }
                .padding(.horizontal)
                //.background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                
                Text("100 Likes")
                    .padding(.horizontal)
                
                HStack{
                    Text("USERNAME")
                        .bold()
                    Text("The caption goes here!")
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Instagram")
        }
    }
}

struct MagnifyingGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyingGesture()
    }
}
