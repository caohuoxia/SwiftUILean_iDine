//
//  ItemRow.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String : Color] = ["V": .orange, "D": .purple, "G": .black, "S": .blue]
    
    
    var body: some View {
        HStack(spacing: 10) {
            Image(item.thumbnailImage)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { res in
                Text(res)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    //default: 给字典某选项设置默认值
                    .background(colors[res, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
