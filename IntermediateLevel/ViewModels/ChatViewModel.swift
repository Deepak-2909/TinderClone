//
//  ChatViewModel.swift
//  IntermediateLevel
//
//  Created by Deepak on 30/05/21.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var chatViewModel = [ChatModel]()
    
    init() {
        // create instance for data service and get data
        
        self.chatViewModel = DataServices.getLocalData()
    }
}
