//
//  main.swift
//  数据结构-codes-swift
//
//  Created by 周伟克 on 2020/7/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



enum Password {
    case number(Int, Int, Int, Int)
    case other
}

print(MemoryLayout<Password>.stride)
print(MemoryLayout<Password>.size)
print(MemoryLayout<Password>.alignment)


enum TestEnum {
//    case test1
//    case test1, test2, test3
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
}
print(MemoryLayout<TestEnum>.stride)
print(MemoryLayout<TestEnum>.size)
print(MemoryLayout<TestEnum>.alignment)



let a: Int? = nil
let b: Int? = 2

