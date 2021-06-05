//
//  ContentView.swift
//  IntermediateLevel
//
//  Created by Deepak on 26/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var press: Bool = false
    var body: some View {
        
        /*
         1. .onLongPressGesture
         */
        VStack{
            Rectangle()
                .fill(press ? Color.red : Color.green)
                .frame(width: 100, height: 60)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50.0) {
                    press = true
                }
                
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
