//
//  LinkedList.swift
//  双向链表
//
//  Created by 周伟克 on 2020/8/27.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


class LinkedList<T> {
    var size = 0
    var head: Node<T>?
    var tail: Node<T>?
    
    /// 追加节点
    func append(_ value: T) {
        let node = Node(value)
        node.prev = tail
        tail?.next = node
        tail = node
        if (head == nil) {
            head = node
        }
        size += 1
    }
    
    /// 插入节点
    func insert(_ value: T, at index: UInt) {
        if index > size {
            fatalError("\(index) out of bunds 0 ..< \(size)")
        }
        
        if (index == size) {
            append(value)
            return
        }
        
        let newNode = Node(value)
        
        if index == 0 {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
            head = head ?? newNode
        } else {
            let old = node(at: index)
            let prev = old?.prev
                
            prev?.next = newNode
            newNode.prev = prev
           
            newNode.next = old
            old?.prev = newNode
        }
        size += 1
    }
    
    /// 删除对应位置的节点
    func delete(at index: UInt) {
        if index >= size {
            fatalError("\(index) out of bunds 0 ..< \(size)")
        }
        if size == 1 {
            clear()
            return
        }
        if index == 0 {
            head = head?.next
            head?.prev = nil
        } else {
            let target = node(at: index)
            let prev = target?.prev
            let next = target?.next
            
            prev?.next = next
            next?.prev = prev
            
            if target === tail {
                tail = prev
            }

        }
        size -= 1 
    }
    
    /// 第index个节点
    func node(at index: UInt) -> Node<T>? {
        if index >= size {
            fatalError("\(index) out of bounds 0 ..< \(size)")
        }
        var cursor: Int
        var node: Node<T>?
        if (index > size >> 1) {
            cursor = size - 1
            node = tail
            while cursor != index {
                node = node?.prev
                cursor -= 1
            }
            return node
        }
        
        cursor = 0
        node = head
        while cursor != index {
            node = node?.next
            cursor += 1
        }
        return node
    }

    /// 从头结点开始遍历
    func travelFromHead() {
        if size == 0 {
            print("空链表")
            return
        }
        var node = head
        var str = ""
        while node != nil {
            str += "\(node!.value)" + arrow
            node = node?.next
        }
        str += "null"
        print(str)
    }
    
    /// 反转
    func reverse() {
        var newHead = head
        var next: Node<T>?
        var nextNext: Node<T>?
        while head?.next != nil {
            
            next = head?.next
            nextNext = head?.next?.next
            
            next?.next = newHead
            newHead?.prev = next
            newHead = next
//            newHead?.prev = nil // ①

            
            head?.next = nextNext
            nextNext?.prev = head
        }
    
        tail = head
        
        head = newHead
        head?.prev = nil // ②
        
        // 由于newHead 的prev 并没有置空，所以从tail向head遍历的时候，会出现环的现象，
        // 解决方法: newHead每次赋新值的时候，直接把newHead.prev 置nil， 或者在反转结束后再置空
    }
    
    /// 从尾结点开始遍历
    func travelFromTail() {
        if (size == 0) {
            print("空链表")
            return 
        }
        var node = tail
        var str = "null"
        while node != nil {
            str += arrow + "\(node!.value)"
            node = node?.prev
        }
        print(str)
    }
    
    func rangeCheck(index: UInt) {
        if index >= size - 1 {
            fatalError("\(index) out of bunds 0 ..< \(size)")
        }
    }
    
    let arrow = "  -->  "
    
    
    func clear() {
        // node.prev 为弱引用，所以节点之后不存在循环应用
        head = nil
        tail = nil
        size = 0
    }
}
