//
//  Task.swift
//  NightWatch
//
//  Created by Zvika Ekhous on 12/1/23.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
