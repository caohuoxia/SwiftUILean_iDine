//
//  Order.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

class Order: ObservableObject {
    // 因为有order和deleteorder，所以items是动态的，设置成发布属性
    @Published var items = [MenuItem]()
    
    var total: Int {
        if items.count > 0 {
            // 上次结果 加上本次item的price，括号里是初始值
            return items.reduce(0) { $0 + $1.price
            }
        }else {
            return 0
        }
    }
    
    func addItem(item: MenuItem) {
        items.append(item)
    }
    
    // 这里暂时没用到
    func removeItem(item: MenuItem) {
        if let index = items.firstIndex(where: { $0 == item }){
            items.remove(at: index)
        }
    }
}
