//
//  Stack.swift
//  栈
//
//  Created by 周伟克 on 2020/9/1.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

/**
 * 频繁在尾结点插入、删除
 * 可以使用数组、双向链表存储数据，二者在尾结点插入的复杂度均为0(1)--前提是该链表记录一个tail节点
 * 二者不足：数组需要动态扩容， 链表需要创建节点对象，且每个对象都要有prev、next属性(提升空间复杂度)，且需要记录tail节点(无tail节点，则push\pop的复杂度为0(n),消耗在遍历上)
 */

class Stack<T> {
    var top: T? { elements.last }
    private(set) var size = 0
    private var elements = [T]()
    
    func push(_ value: T) {
        elements.append(value)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
}

