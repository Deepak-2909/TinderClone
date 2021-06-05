//
//  ProfileView.swift
//  IntermediateLevel
//
//  Created by Deepak on 28/05/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView{
            //Text("Your profile is under construction!")
            VStack{
                
                Image("divyanshu")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding()
                
                Divider()
                
                HStack {
                    Text("Name : ")
                        .bold()
                    Text("Divyanshu Sharma")
                    Spacer()
                }
                
                Divider()
                
                HStack{
                    Text("Age : ")
                        .bold()
                    Text("20")
                    Spacer()
                }
                
                Divider()
                
                HStack(alignment: .top){
                    Text("Bio : ")
                        .bold()
                    Text("Area ka Sanjay Dutt🔫... Girls are always chasing me, pr voh yeh nahi janti k don ko pakadna mushkil hi nahi namunkin hai😎 ")
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Divider()
                
                HStack{
                    Text("University : ")
                        .bold()
                    Text("The NorthCap University")
                    Spacer()
                }
            
                Spacer()
            }
            .padding()
                .navigationBarTitle(("Profile"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Image(systemName: "x.circle")
                }))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
