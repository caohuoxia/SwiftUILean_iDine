//
//  CheckoutView.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct CheckoutView: View {
    // 获取环境变量
    @EnvironmentObject var order: Order
    // state变量，属于该view，一般用private修饰
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("ADD A TIP?")) {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: \(totalPrice)").font(.largeTitle)) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        // 注意alert显示开关
        .alert(isPresented: $showingPaymentAlert, content: {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")) {
                print("you click ok，handle something...")
            })
        })
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
