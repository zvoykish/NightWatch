//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Zvika Ekhous on 12/1/23.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
