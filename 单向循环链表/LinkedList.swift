//
//  LinkedList.swift
//  单项循环链表
//
//  Created by 周伟克 on 2020/8/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

/**
 * 单项循环链表和单项链表本质无异，即多了 tail.next = head
 * 操作上的区别：
 *           1. 遍历的时候，不能依赖node.next = nil, 而应该是node.next = head
 *              作为结束遍历的条件，因为是一个环链表，会死循环
 *           2. 插入、删除的时候，要考虑重新构建环，保证tail.next = head
 *           3. 由于环的存在，所以对该链表的一种理解可以是第size * n个节点都是head，
 *              demo依然按照index >= size的时候取nil，即不考虑环的存在，
 */
import Foundation


class LinkedList<T>: CustomStringConvertible {
    
    var size = 0
    var head: Node<T>?
    var tail: Node<T>?
    
    /// 在任意位置插入
    func insert(_ value: T, at index: UInt) {
        if index > size {
            fatalError("\(index) out of bounds 0 ... size")
        }
        if index == size {
            append(value)
            return
        }
        let newNode = Node(value)
        if index == 0 {
            newNode.next = head
            head = newNode
            tail?.next = newNode
        } else {
            let preNode = node(at: index - 1)
            let oldNode = node(at: index)
            preNode?.next = newNode
            newNode.next = oldNode
        }
        size += 1
    }
    
    /// 追加node
    func append(_ value: T) {
        let newNode = Node(value)
        tail?.next = newNode
        
        tail = newNode
        head = head ?? newNode
        
        newNode.next = head
        
        size += 1

    }
    
    /// 删除node
    func delete(at index: UInt) {
        if index >= size {
            fatalError("\(index) out of bounds 0 ..< \(size)")
        }
        if size == 1 {
            // head = tail的情况
            clear()
        } else if index == 0 {
            // 需要reset head
            head = head?.next
            tail?.next = head
        } else {
            let preNode = node(at: index - 1)
            if index == size - 1 {
                // 需要reset tail
                preNode?.next = head
                tail = preNode
            } else {
                // 中间节点
                preNode?.next = preNode?.next?.next
            }
        }
        size -= 1
    }
    

    func clear() {
        
        head?.next = nil
        head = nil
        tail = nil
        
        size = 0
    }
    
    /// 第index个节点
    func node(at index: UInt) -> Node<T>? {
        if index >= size {
            return nil
        }
        var cursour = 0
        var node = head
        while cursour < index {
            node = node?.next
            cursour += 1
        }
        return node
    }
    
    var description: String {
        if head == nil {
            return "空链表"
        }
        var node = head
        var desc = ""
        repeat {
            desc += "\(node!.value)" + arrow
            node = node?.next
        } while node !== head
        desc += "闭环"
        return desc
    }
    let arrow = "  -->  "
    
    
    /// 反转
    func reverse() {
        var newHead = head
        var next: Node<T>?
        var nextNext: Node<T>?
        while newHead !== tail {
            next = head?.next
            nextNext = head?.next?.next
            next?.next = newHead
            newHead = next
            head?.next = nextNext
        }
    
        tail = head
        head = newHead
        tail?.next = head
    }

}

