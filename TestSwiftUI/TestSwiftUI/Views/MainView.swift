//
//  MainView.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ContentView().tabItem { Label("Menu", systemImage: "list.dash") }
            OrderView().tabItem { Label("Order", systemImage: "square.and.pencil") }
        }.environmentObject(Order())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
