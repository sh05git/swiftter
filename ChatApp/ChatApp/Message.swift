//
//  Message.swift
//  ChatApp
//
//  Created by 内田翔悟 on 2018/11/04.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType { //classではなくstruct!
    var sender: Sender
    var sentDate: Date
    var messageId: String
    var kind: MessageKind
}