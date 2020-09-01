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

    var head: Node<T>?
    var tail: Node<T>?
    
    /// 入队
    func enQueue(_ value: T) {
        let node = Node(value)
        tail?.next = node
        node.prev = tail
        tail = node
        
        if head == nil {
            head = node
        }
    }
    
    /// 出队
    func deQueue() -> T? {
        if head == nil {
            return nil
        }
        let removed = head?.value
        head = head?.next
        if head == nil {
            tail = nil
        }
        return removed
    }
}
