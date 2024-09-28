//
//  AddressView.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 28/09/24.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order = Order()
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Enter name", text: $order.name)
                    TextField("Address", text: $order.streetAddress)
                    TextField("city", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                
                Section {
                    NavigationLink("Checkout", destination: CheckoutView(order: order))
                }
                .disabled(order.hasValidAddress == false)
            }
            .navigationTitle("Address View")
            .navigationBarTitleDisplayMode(.inline)
        }
        

    }
}

#Preview(body: {
    AddressView(order: Order())
})
