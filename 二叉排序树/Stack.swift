//
//  Stack.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/8.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

class Stack<T> {
    var top: T? { elements.last }
    var size: Int { elements.count }
    var isEmpty: Bool { size == 0 }
    private var elements = [T]()
    
    func push(_ value: T) {
        elements.append(value)
    }
    
    @discardableResult
    func pop() -> T? {
        return elements.popLast()
    }
}
