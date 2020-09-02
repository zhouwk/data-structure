//
//  main.swift
//  数组
//
//  Created by 周伟克 on 2020/9/2.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

struct Person {
    let id: Int
    init(_ id: Int) {
        self.id = id
    }
}





func test() {
//    let arr = FixedCapacityArray<Person>.init(capacity: 0)
//    arr.add(.init(0))
//    arr.add(.init(1))
//    arr.add(.init(2))
//    arr.add(.init(3))
//    arr.add(.init(4))
//
//
//    print(arr[0].id)
//    print(arr[1].id)
//    print(arr[2].id)
    
    
//    let arr = CustomArray<Int>.init(capacity: 0)
//    arr.insert(0, at: 0)
//    arr.insert(1, at: 0)
//    arr.insert(2, at: 0)
//    arr.insert(3, at: 3)
//    arr.insert(4, at: 3)
    
    
    let arr =  CustomArray(arrayLiteral: 1, 2, 3, 4)

    print(arr)
    
    arr.removeLast()
    print(arr)
}


test()


