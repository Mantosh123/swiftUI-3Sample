//
//  MBookApp.swift
//  MBook
//
//  Created by Mantosh Kumar on 02/10/24.
//
import SwiftData
import SwiftUI

@main
struct MBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
