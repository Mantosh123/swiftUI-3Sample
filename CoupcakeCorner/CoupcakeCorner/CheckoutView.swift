//
//  CheckoutView.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 28/09/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
               
            }
            
            Section {
                
                
                Button {
                    //
                } label: {
                    Text("Check out")
                }

            }
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
