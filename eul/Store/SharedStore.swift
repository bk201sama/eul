//
//  SharedStore.swift
//  eul
//
//  Created by Gao Sun on 2020/11/24.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import Foundation

enum SharedStore {
    static let battery = BatteryStore()
    static let cpu = CpuStore()
    static let cpuTop = CpuTopStore()
    static let disk = DiskStore()
    static let fan = FanStore()
    static let memory = MemoryStore()
    static let network = NetworkStore()
    static let networkTop = NetworkTopStore()
    static let preference = PreferenceStore()
    static let ui = UIStore()
    static let components = ComponentsStore<EulComponent>(key: "components", allComponents: Array(EulComponent.allCases))
    static let menuComponents = ComponentsStore<EulMenuComponent>(key: "menuComponents", allComponents: Array(EulMenuComponent.allCases))
    static let componentConfig = ComponentConfigStore()
}
