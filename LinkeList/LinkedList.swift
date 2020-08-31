//
//  LinkedList.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



class LinkedList<T: Comparable>: CustomStringConvertible {
    
    var head: Node<T>?
    var tail: Node<T>?
    var size = UInt(0)
    

    /// 追加节点
    func apend(_ value: T) {
        let node = Node(value)
        tail?.next = node
        tail = node
        head = head ?? node
        size += 1
    }
    
    /// 插入节点
    func insert(_ value: T, at index: UInt) {
        if index > size {
            fatalError("\(index) out of bounds  0 ... \(size)")
        }
        if index == size {
            apend(value)
            return
        }
        let newNode = Node(value)
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let prev = node(at: index - 1)
            newNode.next = prev?.next
            prev?.next = newNode
        }
        size += 1
    }
    
    /// 删除节点
    func delete(at index: UInt) {
        if index >= size {
            fatalError("\(index) out of bounds  0 ..< \(size)")
        }
        if size == 1 {
            clear()
            return
        }
        if index == 0 {
            head = head?.next
        } else {
            let prev = node(at: index - 1)
            prev?.next = prev?.next?.next
            if index == size - 1 {
                tail = prev
            }
        }
        size -= 1
    }
    
    /// 删除节点
    func deleteValue(_ value: T) {
        var node: Node<T>?
        var cursor = head
        head = nil
        tail = nil
        while cursor != nil {
            if cursor?.value != value {
                if node != nil {
                    node!.next = cursor
                } else  {
                    head = cursor
                }
                node = cursor
                tail = node
            } else {
                node?.next = nil
            }
            cursor = cursor?.next
        }
    }
    
    /// 反转
    func reverse() {
        // 2 1 3 4 5
        var newHead = head
        var next: Node<T>?
        var nextNext: Node<T>?
        while head?.next != nil  {
            next = head?.next
            nextNext = head?.next?.next
            next?.next = newHead
            head?.next = nextNext
            newHead = next
        }
        head = newHead
    }
    
    /// 是否包含环
    func containsLoop() -> Bool {
        var slow = head?.next
        var fast = head?.next?.next
        while slow?.next != nil, fast?.next?.next != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    
    /// 第index个node
    private func node(at index: UInt) -> Node<T>? {
        var node = head
        for _ in 0 ..< index {
            if node?.next == nil {
                return nil
            }
            node = node?.next
        }
        return node
    }
    
    var description: String {
        guard let head = head else {
            return "空链表"
        }
        var node: Node<T>? = head
        var desc = ""
        while let tempNode = node {
            desc += "\(tempNode.value)  ->  "
            node = tempNode.next
        }
        desc += "null"
        return desc
    }

    func clear() {
        head = nil
        tail = nil
        size = 0
    }
}
