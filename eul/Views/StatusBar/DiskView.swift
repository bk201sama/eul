//
//  DiskView.swift
//  eul
//
//  Created by Gao Sun on 2020/11/1.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import SwiftUI

struct DiskView: View {
    @EnvironmentObject var diskStore: DiskStore
    @EnvironmentObject var preferenceStore: PreferenceStore

    var texts: [String] {
        [diskStore.freeString, diskStore.usageString]
    }

    var body: some View {
        HStack(spacing: 6) {
            if preferenceStore.showIcon {
                Image("Disk")
                    .resizable()
                    .frame(width: 13, height: 13)
            }
            StatusBarTextView(texts: texts)
                .stableWidth()
        }
    }
}
