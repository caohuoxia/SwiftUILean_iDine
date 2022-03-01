//
//  LayoutViewLearn.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import SwiftUI

struct LayoutViewLearn: View {
    var body: some View {
        VStack {
            HStack {
                Text("This is a short string.")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.red)
                Text("This is a very long string with lots and lots of text that will definitely run across multiple lines because it is just so long")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.green)
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .frame(maxHeight: 200)
            
            // fixedSize + frame 结合使用才有效
            VStack {
                Button("Log in") {}
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(Capsule())
                Button("Reset Password") {}
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
        }
        
    }
}

struct LayoutViewLearn_Previews: PreviewProvider {
    static var previews: some View {
        LayoutViewLearn()
    }
}
