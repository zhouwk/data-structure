//
//  BiTree.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/8.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


class BiTree {
    
    var root: Node?
    
    /// 入口(先序遍历)
    func createBiTree(using values: [String]) -> Node? {
        if values.count == 0 {
            return nil
        }
        root = Node(values[0])
        var index = 0
        createChildren(for: root!) { () -> Node? in
            // 该闭包的功能：累加index，遍历values
           // 如果index == values.count，则遍历结束，则不会创建新节点
           // 如果values[index] == EOF，则表明正在遍历的节点没有对应位置的子节点，至于具体位置，则取决于createNodeChildren中是left调用的，还是right调用的
           index += 1
           if index >= values.count {
               return nil
           }
           let value = values[index]
           if value == EOT {
               return nil
           }
           return Node(value)
        }
        return root
    }

    /// 创建节点的children
    ///
    /// - Parameter node: 当前正在遍历的节点，也是为该节点创建左右子节点
    /// - Parameter next: 闭包调用接收新的节点，新的节点将作为node的左或右子节点
    private func createChildren(for node: Node, next: () -> Node?) {
        if let lChild = next() {
            node.lChild = lChild
            createChildren(for: lChild, next: next)
        }
        if let rChild = next() {
            node.rChild = rChild
            createChildren(for: rChild, next: next)
        }
    }
    
    
    /// 递归前序遍历
    func preOrderTravelRecursively(node: Node) {
        print(node.value, terminator: terminator)
        if let lChild = node.lChild {
            preOrderTravelRecursively(node: lChild)
        }
        if let rChild = node.rChild {
            preOrderTravelRecursively(node: rChild)
        }
    }
    /// 递归中序遍历
    func inOrderTravelRecursively(node: Node) {
        if let lChild = node.lChild {
            inOrderTravelRecursively(node: lChild)
        }
        print(node.value, terminator: terminator)
        if let rChild = node.rChild {
            inOrderTravelRecursively(node: rChild)
        }
    }
    /// 递归后序遍历
    func postOrderTravelRecursively(node: Node) {
        if let lChild = node.lChild {
            postOrderTravelRecursively(node: lChild)
        }
        if let rChild = node.rChild {
            postOrderTravelRecursively(node: rChild)
        }
        print(node.value, terminator: terminator)
    }
    
    /// 使用栈进行前序遍历
    func preOrderTravelUsingStack() {
        if root == nil { return }
        let stack = Stack<Node>()
        var cursor = root
        while cursor != nil || !stack.isEmpty {
            if cursor != nil {
                print(cursor!.value, terminator: terminator)
                stack.push(cursor!)
                cursor = cursor?.lChild
            } else {
                cursor = stack.pop()?.rChild
            }
        }
    }
    
    /// 使用栈进行中序遍历
    func inOrderTravelUsingStack() {
        if root == nil { return }
        let stack = Stack<Node>()
        var cursor: Node? = root
        while cursor != nil || !stack.isEmpty {
            if cursor != nil {
                stack.push(cursor!)
                cursor = cursor?.lChild
            } else {
                print(stack.top!.value, terminator: terminator)
                cursor = stack.pop()?.rChild
            }
        }
    }
    
    /// 使用栈进行后序遍历
    func postOrderTravelUsingStack() {
//        guard let root = root else { return }
    }
    
    
    /// 层序遍历(使用栈)
    func levelOrderTravelUsingStack() {
        
    }
    
    let terminator = "   "
}

