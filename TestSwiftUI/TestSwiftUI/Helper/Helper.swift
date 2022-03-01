//
//  Helper.swift
//  TestSwiftUI
//
//  Created by caohx on 2022/3/1.
//

import Foundation

// 扩展 通过文件名 直接加载并返回相应类型的model数据。注意泛型T的使用
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Faild to decode \(file) from bundle")
        }
        
        return loaded
    }
}
