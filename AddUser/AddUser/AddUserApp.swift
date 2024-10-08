//
//  AddUserApp.swift
//  AddUser
//
//  Created by Mantosh Kumar on 08/10/24.
//

import SwiftUI
import SwiftData

@main
struct AddUserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
