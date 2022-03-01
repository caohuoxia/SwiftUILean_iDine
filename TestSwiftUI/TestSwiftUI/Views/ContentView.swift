//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.menu) { sec in
                    Section(header: Text(sec.name)) {
                        ForEach(sec.items) { item in
                            NavigationLink(
                                destination: ItemDetailView(item: item),
                                label: {
                                    ItemRow(item: item)
                                })
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
