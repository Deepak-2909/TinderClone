//
//  ChatModel.swift
//  IntermediateLevel
//
//  Created by Deepak on 28/05/21.
//

import Foundation
import SwiftUI

class ChatModel: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var age: String
    var bio: String
    var message: String
    var image: String
    
}

//#if DEBUG
//let testData = [
//    ChatModel(name: "Divyanshu", message: "No new messages", image: "divyanshu"),
//    ChatModel(name: "Anuj", message: "No new messages", image: ""),
//    ChatModel(name: "Akbar", message: "No new messages", image: ""),
//    ChatModel(name: "Birbal", message: "No new messages", image: <#String#>),
//    ChatModel(name: "Hindustani Bhau", message: "No new messages")
//]
//#endif
