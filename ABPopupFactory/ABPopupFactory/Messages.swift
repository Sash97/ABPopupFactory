//
//  Messages.swift
//  Evenation
//
//  Created by Aleksandr Bagdasaryan on 4/7/20.
//  Copyright © 2020 Aleksandr Bagdasaryan. All rights reserved.
//

import Foundation


public enum Messages: CustomStringConvertible {
    case message(message: String)
    
    public var description: String {
        switch self {
        case .message(let message): return message
        }
    }
}

