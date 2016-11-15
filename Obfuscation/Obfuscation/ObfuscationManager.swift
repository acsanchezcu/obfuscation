//
//  ObfuscationManager.swift
//  Obfuscation
//
//  Created by Abel Sánchez Custodio on 15/11/16.
//  Copyright © 2016 acsanchezcu. All rights reserved.
//

import Foundation
import Obfuscator

class ObfuscationManager {

    // MARK: - Shared Instance
    
    static let sharedInstance : ObfuscationManager = {
        let private_key_obfuscator = Obfuscator.new(withSaltUnsafe: String(describing: AppDelegate.self))
        
        let obfuscator = Obfuscator.new(withSaltUnsafe: private_key_obfuscator?.reveal(Keys.privateKey))
        
        let instance = ObfuscationManager(obfuscator: obfuscator!)
        return instance
    }()
    
    // MARK: - Properties
    
    var obfuscator: Obfuscator
    
    // MARK: - Init
    
    init(obfuscator: Obfuscator) {
        self.obfuscator = obfuscator
        
        generateHexs()
    }
    
    // MARK: - Methods
    
    func getString(key: UnsafePointer<UInt8>) -> String {
        return obfuscator.reveal(key)
    }
    
    // MARK: - Warning<Delete content after their use>
    
    func generateHexs() {
//        let urlString = obfuscator.hex(byObfuscatingString: "https://httpbin.org/get")
//        let userId = obfuscator.hex(byObfuscatingString: "83715713")
    }
}
