//
//  CheckoutView.swift
//  CoupcakeCorner
//
//  Created by Mantosh Kumar on 28/09/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @Bindable var order: Order
    
    @State private var orderMessage = ""
    @State private var showconfirmation = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                    } placeholder: {
                        ProgressView()
                    }.frame(height: 200)
                    
                    Text("Your total order amount: \(order.cost, format: .currency(code: "IND"))")
                        .bold()
                        .padding()
                    
                    Button("Place order", action: {
                        Task {
                           await placeOrder()
                        }
                    }).padding()
                    
                }.padding()
            }.navigationTitle("Checkout")
                .navigationBarTitleDisplayMode(.inline)
                .scrollBounceBehavior(.basedOnSize)
                .alert("Thank you! ", isPresented: $showconfirmation) {
                    
                }message: {
                    Text(orderMessage.localizedLowercase)
                }
        }
    }
    func placeOrder() async {
        
        guard let encoding = try? JSONEncoder().encode(order) else {
            debugPrint("faild to encode")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            
            let (data, _ ) = try await URLSession.shared.upload(for: request, from: encoding)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            orderMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way"
            showconfirmation = true
            
        } catch {
            print("Somthing went wrong ")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
