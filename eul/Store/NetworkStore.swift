//
//  NetworkStore.swift
//  eul
//
//  Created by Gao Sun on 2020/8/9.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import Foundation
import SharedLibrary
import WidgetKit

class NetworkStore: ObservableObject, Refreshable {
    private var network = Info.Network()
    private var lastTimestamp: TimeInterval

    @Published var inSpeedInByte: Double = 0
    @Published var outSpeedInByte: Double = 0

    var inSpeed: String {
        ByteUnit(inSpeedInByte).readable + "/s"
    }

    var outSpeed: String {
        ByteUnit(outSpeedInByte).readable + "/s"
    }

    @objc func refresh() {
        let current = Info.Network()
        let time = Date().timeIntervalSince1970

        if current.inBytes >= network.inBytes {
            inSpeedInByte = Double(current.inBytes - network.inBytes) / (time - lastTimestamp)
        } else {
            inSpeedInByte = 0
        }

        if current.outBytes >= network.outBytes {
            outSpeedInByte = Double(current.outBytes - network.outBytes) / (time - lastTimestamp)
        } else {
            outSpeedInByte = 0
        }

        lastTimestamp = time
        network = current
        writeToContainer()
    }

    func writeToContainer() {
        Container.set(NetworkEntry(inSpeedInByte: inSpeedInByte, outSpeedInByte: outSpeedInByte))
        if #available(OSX 11, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: NetworkEntry.kind)
        }
    }

    init() {
        lastTimestamp = Date().timeIntervalSince1970
        initObserver(for: .NetworkShouldRefresh)
    }
}
