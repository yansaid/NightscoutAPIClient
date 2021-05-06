//
//  NightscoutAPIManager+UI.swift
//  NightscoutAPIClientUI
//
//  Created by Ivan Valkou on 21.10.2019.
//  Copyright © 2019 Ivan Valkou. All rights reserved.
//

import SwiftUI
import LoopKit
import LoopKitUI
import HealthKit
import NightscoutAPIClient

extension NightscoutAPIManager: CGMManagerUI {
    
    public static func setupViewController(bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> SetupUIResult<UIViewController & CGMManagerCreateNotifying & CGMManagerOnboardNotifying & CompletionNotifying, CGMManagerUI> {
        let setupVC = NightscoutAPISetupViewController()
        return .userInteractionRequired(setupVC)
    }
    
    public func settingsViewController(for displayGlucoseUnitObservable: DisplayGlucoseUnitObservable, bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> (UIViewController & CGMManagerOnboardNotifying & CompletionNotifying) {
        let settings =  NightscoutAPISettingsViewController(cgmManager: self, displayGlucoseUnitObservable: displayGlucoseUnitObservable)
        let nav = CGMManagerSettingsNavigationViewController(rootViewController: settings)
        return nav
    }
    
    public var cgmStatusBadge: DeviceStatusBadge? {
        nil
    }


    public var smallImage: UIImage? { nil }
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmStatusHighlight: DeviceStatusHighlight? {
        return nil
    }

    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmLifecycleProgress: DeviceLifecycleProgress? {
        return nil
    }
}
