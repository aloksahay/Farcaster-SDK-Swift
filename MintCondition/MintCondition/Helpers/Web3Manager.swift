//
//  Web3Manager.swift
//  MintCondition
//
//  Created by Alok Sahay on 09.08.2024.
//

import Foundation
import Web3
import BigInt

class Web3Manager {
    
    static let sharedManager = Web3Manager()
    
    func getPvtKey() -> String? {
        if let privateKey = ProcessInfo.processInfo.environment["PRIVATE_KEY"] {
            return privateKey
        } else {
            return nil
        }
    }
    
    
    
    
    
    
    
}
