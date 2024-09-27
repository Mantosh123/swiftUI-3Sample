//
//  ContentView.swift
//  VibrationEffect
//
//  Created by Mantosh Kumar on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    
    var body: some View {
        
        Form {
            Button("Tap me for Soft Viration Impact \(counter)") {
                counter += 1
            }.sensoryFeedback( .impact(flexibility: .soft, intensity:1.5) ,trigger: counter)
            
            Button("Tap me for Solid Viration Impact \(counter)") {
                counter += 1
            }.sensoryFeedback( .impact(flexibility: .solid, intensity: 0.5) ,trigger: counter)
            
            Button("Tap me for Rigid Viration Impact \(counter)") {
                counter += 1
            }.sensoryFeedback( .impact(flexibility: .rigid, intensity: 0.5) ,trigger: counter)
        }
    }
}

#Preview {
    ContentView()
}
