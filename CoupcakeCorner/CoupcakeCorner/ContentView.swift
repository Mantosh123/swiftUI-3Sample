//
//  ContentView.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cake : \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any Special Request", isOn: $order.specialRequestEnable.animation())
                    
                    if (order.specialRequestEnable) {
                        Toggle("Add extra frosting", isOn: $order.expraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkless)
                    }
                }
                
                Section {
                    NavigationLink("Address view") {
                        AddressView(order: order)
                    }
                }
            }.navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
