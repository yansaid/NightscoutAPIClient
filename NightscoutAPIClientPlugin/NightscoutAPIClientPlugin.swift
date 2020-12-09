//
//  NightscoutAPIClientPlugin.swift
//  NightscoutAPIClientPlugin
//
//  Created by Yan on 2020/12/9.
//  Copyright © 2020 Ivan Valkou. All rights reserved.
//

import Foundation
import LoopKitUI
import NightscoutAPIClient
import NightscoutAPIClientUI
import os.log

class NightscoutAPIClientPlugin: NSObject, LoopUIPlugin {
    
    private let log = OSLog(category: "NightscoutAPIClientPlugin")
    
    public var pumpManagerType: PumpManagerUI.Type? {
        return nil
    }
    
    public var cgmManagerType: CGMManagerUI.Type? {
        return NightscoutAPIClient.self
    }
    
    override init() {
        super.init()
        log.default("NightscoutAPIClientPlugin Instantiated")
    }
}
