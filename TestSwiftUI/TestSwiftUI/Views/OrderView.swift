//
//  OrderView.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    // 动态ForEach 才会有onDelete这些操作方法
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        order.items.remove(atOffsets: indexSet)
                    })
                }
                
                Section {
                    NavigationLink(
                        destination: CheckoutView(),
                        label: {
                            Text("Place Order")
                        })
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(GroupedListStyle())
            .toolbar {
                EditButton()
            }
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
