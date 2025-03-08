//
//  PowerStateMonitor.swift
//  SmoothSwiftUIDrag
//
//  Created by Caleb Kierum on 3/8/25.
//

import Foundation

@Observable
class PowerStateMonitor {
    private(set) var lowPowerEnabled: Bool = false
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(powerStateChanged), name: Notification.Name.NSProcessInfoPowerStateDidChange, object: nil)
        powerStateChanged()
    }
    
    @objc private func powerStateChanged() {
        lowPowerEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
    }
}
