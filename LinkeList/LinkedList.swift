//
//  LinkedList.swift
//  LinkeList
//
//  Created by 周伟克 on 2020/8/10.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



class LinkedList<T: Comparable>: CustomStringConvertible {
    
    private var first: Node<T>?
    
    /// 追加节点
    func appendNode(_ element: T) {
        let node = Node(element: element)
        appendNode(node)
    }

    /// 追加节点
    func appendNode(_ node: Node<T>) {
        if let last = first?.last {
            last.next = node
        } else {
            first = node
        }
    }
    
    /// 插入节点T
    func insertNode(_ element: T, at index: uint) {
        insertNode(Node(element: element), at: index)
    }
    
    /// 插入节点
    func insertNode(_ node: Node<T>, at index: uint) {
        if index == 0 {
            node.last?.next = first
            first = node
        } else {
            let previous = nodeAtIndex(index - 1)
            let current = previous?.next
            previous?.next = node
            node.last?.next = current
        }
    }
    
    /// 删除节点
    func deleteNodeAtIndex(_ index: uint) -> Node<T>? {
        if (index == 0) {
            let tempFirst = first
            first = first?.next
            return tempFirst
        }
        let previous = nodeAtIndex(index - 1)
        let current = previous?.next
        previous?.next = current?.next
        return current
    }
    
    /// 删除节点
    func deleteNode(_ element: T) {
        var node: Node<T>?
        var cursor = first
        first = nil
        while cursor != nil {
            if cursor?.element != element {
                if node != nil {
                    node!.next = cursor
                } else  {
                    first = cursor
                }
                node = cursor
            } else {
                node?.next = nil
            }
            cursor = cursor?.next
        }
    }
    
    /// 反转
    func reverse() {
        // 2 1 3 4 5
        var newFirst = first
        var next: Node<T>?
        var nextNext: Node<T>?
        while first?.next != nil  {
            next = first?.next
            nextNext = first?.next?.next
            next?.next = newFirst
            first?.next = nextNext
            newFirst = next
        }
        first = newFirst
    }
    
    /// 是否包含环
    func containsLoop() -> Bool {
        var slow = first?.next
        var fast = first?.next?.next
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
    func nodeAtIndex(_ index: uint) -> Node<T>? {
        var node = first
        for _ in 0 ..< index {
            print("....")
            if node?.next == nil {
                return nil
            }
            node = node?.next
        }
        return node
    }
    
    var description: String {
        guard let first = first else {
            return "空链表"
        }
        var node: Node<T>? = first
        var desc = ""
        while let tempNode = node {
            desc += "\(tempNode.element)  ->  "
            node = tempNode.next
        }
        desc += "null"
        return desc
    }
}
