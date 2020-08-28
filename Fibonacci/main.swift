//
//  main.swift
//  Fibonacci
//
//  Created by 周伟克 on 2020/7/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

// 0 1 1 2 3 5 8 13， 角标从0开始
func fibonacciGeneratorA(num: Int) -> Int {
    if num < 2 {
        return num
    }
    return fibonacciGeneratorA(num: num - 1) + fibonacciGeneratorA(num: num - 2)
}


func fibonacciGeneratorB(num: Int) -> Int {
    if (num < 2) {
        return num
    }
    // 0 1 1 2 3 5 8 13
    var first = 1
    var second = 1
    var sum = 0
    for _ in 2 ..< num {
        sum = first + second
        first = second
        second = sum
    }
    return second
}

var date = Date()
print(fibonacciGeneratorA(num: 40))
print("耗时     \(Date().timeIntervalSince(date))")

print("--------------------------------------")
date = Date()
print(fibonacciGeneratorB(num: 40))
print("耗时     \(Date().timeIntervalSince(date))")
