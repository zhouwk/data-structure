//
//  Queue.swift
//  队列
//
//  Created by 周伟克 on 2020/9/1.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

// FIFO, 考虑到需要在首结点频繁出队、尾节点频繁入队，所以考虑使用双向链表，时间复杂度均为O(1)(存储head\tail的情况下)
//       动态数组在首节点插入的时间复杂度为O(N)

class Queue<T> {

    var head: T? { list.head?.value }
    var tail: T? { list.tail?.value }
    var size: UInt { list.size }
    private let list = LinkedList<T>()
    
    /// 入队
    func enQueue(_ value: T) {
        list.append(value)
    }
    /// 出队
    func deQueue() -> T? {
        list.size == 0 ? nil : list.deleteNode(at: list.size - 1).value
    }
}
