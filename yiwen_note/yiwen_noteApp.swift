//
//  yiwen_noteApp.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import SwiftUI

@main
struct yiwen_noteApp: App {
    @StateObject private var evenData = EventData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(evenData)
        }
    }
}
